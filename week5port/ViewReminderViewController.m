//
//  ViewReminderViewController.m
//  week5port
//
//  Created by double on 23/04/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import "ViewReminderViewController.h"

@interface ViewReminderViewController ()

@end

@implementation ViewReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     // Do any additional setup after loading the view.
     self.titleTextField.text = [self.selectedReminder valueForKey:@"title"];
     self.descTextField.text = [self.selectedReminder valueForKey:@"desc"];
     
//     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//     dateFormatter.dateFormat =@"yyyy-MM-dd";
    
     self.datePicker.date = [self.selectedReminder valueForKey:@"date"];
    if([[self.selectedReminder valueForKey:@"completeStatus"] boolValue])
    {
        [self.statusSwitch setOn:YES animated:YES];
    }else{
        [self.statusSwitch setOn:NO animated:YES];
    }

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

- (IBAction)saveButton:(id)sender {
    if([self.titleTextField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input" message:@"Title cannot be empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else if([self.descTextField.text isEqualToString:@""])
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input" message:@"Description cannot be empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
        [self.selectedReminder setValue:self.titleTextField.text forKey:@"title"];
        [self.selectedReminder setValue:self.descTextField.text forKey:@"desc"];
        [self.selectedReminder setValue:self.datePicker.date forKey:@"date"];
        [self.selectedReminder setValue:[NSNumber numberWithBool:self.statusSwitch.on ]forKey:@"completeStatus"];
        [self.navigationController popViewControllerAnimated:YES];
        
    }

    
    
}
@end
