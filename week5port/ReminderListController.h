//
//  ReminderListController.h
//  week5port
//
//  Created by double on 23/04/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"
#import "ReminderCell.h"
#import "AddReminderViewController.h"
#import "ViewReminderViewController.h"
#import "ReminderList.h"

@interface ReminderListController : UITableViewController<AddReminderDelegate,ViewReminderDelegate>

@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;

@property (strong, nonatomic) NSArray* currentReminderArray;
@property (strong, nonatomic) ReminderList* currentReminderList;
@property (nonatomic) int currentIndex;
@property (strong, nonatomic) ViewReminderViewController* viewReminderController;

@end
