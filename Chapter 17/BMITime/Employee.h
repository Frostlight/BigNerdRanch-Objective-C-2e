//
//  Employee.h
//  BMITime
//
//  Created by Vincent on 3/22/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@class Asset;

// Employees are like Person but with an extra ID
@interface Employee : Person {
    int employeeID;
    NSMutableSet *assets;
}

@property int employeeID;

- (void)addAssetsObject:(Asset *)a;
- (unsigned int)valueOfAssets;

@end
