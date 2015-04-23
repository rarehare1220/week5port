//
//  ViewReminderViewController.h
//  week5port
//
//  Created by double on 23/04/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"

@protocol ViewReminderDelegate <NSObject>

-(void)viewReminder:(Reminder *)reminder;

@end

@interface ViewReminderViewController : UIViewController

@property (weak, nonatomic) id<ViewReminderDelegate> delegate;
@property (strong, nonatomic) Reminder* currentReminderItem;
@property (strong,nonatomic) NSManagedObject* selectedReminder;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;


@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *descTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (strong, nonatomic) IBOutlet UISwitch *statusSwitch;

- (IBAction)saveButton:(id)sender;



@end
