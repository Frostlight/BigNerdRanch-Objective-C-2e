//
//  Asset.m
//  BMITime
//
//  Created by Vincent on 3/22/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "Asset.h"
#import "Employee.h"

@implementation Asset

@synthesize label, resaleValue, holder;

- (NSString *)description {
    // Is holder non-nil?
    if (holder) {
        return [NSString stringWithFormat:@"<%@: %u, assigned to Employee %u>",
                label, resaleValue, [holder employeeID]];
    } else {
        return [NSString stringWithFormat:@"<%@: %u, unassigned>",
                label, resaleValue];
    }
    
}

- (void)dealloc {
    NSLog(@"Deallocating %@", self);
}

@end
