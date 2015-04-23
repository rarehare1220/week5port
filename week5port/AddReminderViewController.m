//
//  AddReminderViewController.m
//  week5port
//
//  Created by double on 23/04/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import "AddReminderViewController.h"

@interface AddReminderViewController ()

@end

@implementation AddReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addReminderButton:(id)sender {
    if([self.inputTitle.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input" message:@"Title cannot be empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else if([self.inputDesc.text isEqualToString:@""])
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input" message:@"Description cannot be empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
        NSString *title = self.inputTitle.text;
        NSString *desc = self.inputDesc.text;
        NSDate *date = self.inputDate.date;
        
        
        Reminder *reminder = [NSEntityDescription insertNewObjectForEntityForName:@"Reminder"
                                                           inManagedObjectContext:self.managedObjectContext];
        [reminder setTitle:title];
        [reminder setDesc:desc];
        [reminder setDate:date];
        [reminder setCompleteStatus:[NSNumber numberWithBool:NO]];
        [self.delegate addReminder:reminder];
        [self.navigationController popViewControllerAnimated:YES];
        
    }

}
@end
