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
        NSDate *now = [NSDate date];
        
        // %p asks the object to print a location
        NSLog(@"The new date lives at %p", now);
        
        // %@ asks the object to print a string
        NSLog(@"The date is %@", now);
    }
    return 0;
}
