//
//  main.m
//  DateList
//
//  Created by Vincent on 3/21/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create three NSDate Objects
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        
        // Create an array containing the three items (nil terminates the list)
        // NSArray is not mutable (i.e. cannnot add or remove pointers)
        // NSArray *dateList = [NSArray arrayWithObjects:now, tomorrow, yesterday, nil];
        
        // NSMutableArray is mutable
        NSMutableArray *dateList = [NSMutableArray array];
        
        // Add the objects to the mutable array (can also intialize the same way as NSArray)
        [dateList addObject:now];
        [dateList addObject:tomorrow];
        [dateList addObject:yesterday];
        
        // Put yesteday at the beginning of the list
        [dateList insertObject:yesterday atIndex:0];
        
        // How many dates are there?
        NSUInteger numDates = [dateList count];
        NSLog(@"There are %lu dates", numDates);
        
        // Print some dates
        for (int i = 0; i < numDates; i++) {
            NSLog(@"Date at index %d: %@", i, [dateList objectAtIndex:i]);
        }
        
        // Remove yesterday (for demonstration)
        [dateList removeObject:yesterday];
        NSLog(@"Now the first date is %@", [dateList objectAtIndex:0]);
        
        // Alternative for loop (fast enumeration)
        // Inefficient here because index number is not saved in i
        /* 
        for (NSDate *i in dateList) {
            NSLog(@"Date at index %lu: %@", [dateList indexOfObject:i], i);
        }
        */
    }
    return 0;
}
