//
//  Reminder.h
//  week5port
//
//  Created by double on 23/04/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ReminderList;

@interface Reminder : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * completeStatus;
@property (nonatomic, retain) ReminderList *reminderlist;



@end
