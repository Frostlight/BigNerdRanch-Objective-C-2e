//
//  main.m
//  TimeAfterTime
//
//  Created by Vincent on 3/20/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // The "date" method creates an instance of NSDate and initializes it
        // to the current date/time (returns address where the object starts
        NSDate *now = [[NSDate alloc] init];
        
        // %p asks the object to print a location
        NSLog(@"The new date lives at %p", now);
        
        // %@ asks the object to print a string
        NSLog(@"The date is %@", now);
        
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since 1970", seconds);
        
        // Date 100,000 seconds in the future
        NSDate *future = [now dateByAddingTimeInterval:100000];
        NSLog(@"In 100,000 seconds it will be %@", future);
        
        // NSDateComponents for my birthday
        NSDateComponents *birthdayComps = [[NSDateComponents alloc] init];
        [birthdayComps setYear:1992];
        [birthdayComps setMonth:7]; // Unlike in C, NSDate month starts from 1 = January
        [birthdayComps setDay:30];
        
        // Initialize date of birth as NSDate object
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *dateOfBirth = [calendar dateFromComponents:birthdayComps];
        
        // Difference between now and birthday
        double d = [now timeIntervalSinceDate:dateOfBirth];
        
        NSLog(@"I have been alive for %f seconds", d);
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSUInteger day = [cal ordinalityOfUnit:NSCalendarUnitDay
                                             inUnit:NSCalendarUnitMonth
                                            forDate:now];
        NSLog(@"This is the %lu of the month", day);
        
        // Find whether or not daylight savings time is active
        NSTimeZone *timezone = [NSTimeZone systemTimeZone];
        bool daylightSavings = [timezone isDaylightSavingTime];
        
        if (daylightSavings) {
            NSLog(@"Daylight savings time is active");
        } else {
            NSLog(@"Daylight savings time is NOT active");
        }
    }
    
    return 0;
}
