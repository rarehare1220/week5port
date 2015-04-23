//
//  ReminderList.h
//  week5port
//
//  Created by double on 23/04/2015.
//  Copyright (c) 2015 double. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reminder;

@interface ReminderList : NSManagedObject

@property (nonatomic, retain) NSSet *members;
@end

@interface ReminderList (CoreDataGeneratedAccessors)

- (void)addMembersObject:(Reminder *)value;
- (void)removeMembersObject:(Reminder *)value;
- (void)addMembers:(NSSet *)values;
- (void)removeMembers:(NSSet *)values;

@end
