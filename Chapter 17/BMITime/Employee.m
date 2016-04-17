//
//  Employee.m
//  BMITime
//
//  Created by Vincent on 3/22/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "Employee.h"
#import "Asset.h"

@implementation Employee

@synthesize employeeID;

// Override description to state employee ID and value in assets
- (NSString *)description {
    return [NSString stringWithFormat:@"<Employee %d: $%u in assets>", employeeID, [self valueOfAssets]];
}

// Child classes can overload parent class methods
- (float)bodyMassIndex {
    // Employees have 10% lower bmi
    // Parent class (superclass) is referenced by the "super" directive
    return [super bodyMassIndex] * 0.9;
}

- (void)addAssetsObject:(Asset *)a {
    // Check if assets is nil first
    if (!assets) {
        // Create the array
        assets = [[NSMutableSet alloc] init];
    }
    [assets addObject:a];
    [a setHolder:self];
}

- (unsigned int)valueOfAssets {
    // Sum up the resale value of the assets
    unsigned int sum = 0;
    for (Asset *a in assets) {
        sum += [a resaleValue];
    }
    return sum;
}



@end
