//
//  ReminderListController.m
//  week5port
//
//  Created by double on 23/04/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import "ReminderListController.h"

@interface ReminderListController ()

@end

@implementation ReminderListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"ReminderList"];
    NSError* error;
    NSArray* result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if(result == nil) {
        NSLog(@"Could not fetch table:\n%@", error.userInfo); }
    else if([result count] == 0)
    {
        self.currentReminderList = [NSEntityDescription insertNewObjectForEntityForName:@"ReminderList"
                                                               inManagedObjectContext:self.managedObjectContext]; }
    else
    {
        self.currentReminderList = [result firstObject];
        self.currentReminderArray = [self.currentReminderList.members allObjects];
        self.currentReminderArray = [self.currentReminderArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            NSDate *first = [(Reminder*)a date];
            NSDate *second = [(Reminder*)b date];
            return [first compare:second];
        }];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    switch (section)
    {
        case 0:
            return [self.currentReminderArray count];
        case 1:
            return 1;
    }
    return 0;

}


-(void) viewDidAppear:(BOOL)animated{
    
    self.currentReminderArray = [self.currentReminderArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSDate *first = [(Reminder*)a date];
        NSDate *second = [(Reminder*)b date];
        return [first compare:second];
    }];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    if(indexPath.section == 0)
    {
        ReminderCell *cell = (ReminderCell*)[tableView dequeueReusableCellWithIdentifier:@"ReminderCell" forIndexPath:indexPath];
        // Configure the cell...
        Reminder* r = [self.currentReminderArray objectAtIndex:indexPath.row];
        cell.titleLabel.text = r.title;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat =@"yyyy-MM-dd";
        cell.dateLabel.text = [dateFormatter stringFromDate:r.date];
        return cell;
        
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TotalCell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"Total Reminders: %d", [self.currentReminderArray count]];
        return cell;
    }
    
    return nil;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //This method defineds what happens when a row is editted. In or case what happens when a row is deleted.
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        Reminder* reminderToRemove = [self.currentReminderArray objectAtIndex:indexPath.row];
        [self.currentReminderList removeMembersObject:reminderToRemove];
        self.currentReminderArray = [self.currentReminderList.members allObjects];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        NSError* error;
        if(![self.managedObjectContext save:&error])
        {
            NSLog(@"Error Delete:\n%@", error.userInfo);
        }
    }
}
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"AddReminderSegue"])
    {
        AddReminderViewController* controller = segue.destinationViewController;
        controller.managedObjectContext = self.managedObjectContext;
        controller.delegate = self;
    }
    else if([segue.identifier isEqualToString:@"ViewReminderSegue"])
    {
        self.viewReminderController = segue.destinationViewController;
        NSManagedObject* selectedReminder = (NSManagedObject *)[self.currentReminderArray objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
        self.viewReminderController.selectedReminder = selectedReminder;
    }
}

//Add Reminder:
-(void)addReminder:(Reminder *)reminder
{
    [self.currentReminderList addMembersObject:reminder];
    self.currentReminderArray = [self.currentReminderList.members allObjects];
    self.currentReminderArray = [self.currentReminderArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSDate *first = [(Reminder*)a date];
        NSDate *second = [(Reminder*)b date];
        return [first compare:second];
    }];
    NSError* error;
    if(![self.managedObjectContext save:&error])
    {
        NSLog(@"Could not add reminder:\n%@", error.userInfo);
    }
    [self.tableView reloadData];
}

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
