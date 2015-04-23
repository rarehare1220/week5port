//
//  AddReminderViewController.h
//  week5port
//
//  Created by double on 23/04/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"


@protocol AddReminderDelegate <NSObject>

-(void) addReminder:(Reminder*) reminder;

@end

@interface AddReminderViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *inputTitle;
@property (strong, nonatomic) IBOutlet UITextField *inputDesc;
@property (strong, nonatomic) IBOutlet UIDatePicker *inputDate;

@property (weak, nonatomic) id<AddReminderDelegate> delegate;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;



- (IBAction)addReminderButton:(id)sender;


@end
