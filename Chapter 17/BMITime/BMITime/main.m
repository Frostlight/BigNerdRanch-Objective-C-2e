//
//  main.m
//  BMITime
//
//  Created by Vincent on 3/22/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Asset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create an array of Employee objects
        NSMutableArray *employees = [NSMutableArray array];
        
        for (int i = 0; i < 10; i++) {
            // Create an Employee
            Employee *person = [[Employee alloc] init];
            
            // Give the instance variables interesting values
            [person setWeightInKilos:90 + i];
            [person setHeightInMeters:1.8 - i/10.0];
            [person setEmployeeID:i];
            
            // Put the employee in the array
            [employees addObject:person];
        }
        
        NSMutableArray *allAssets = [NSMutableArray array];
        
        // Create ten assets
        for (int i = 0; i < 10; i++) {
            // Create an asset
            Asset *asset = [[Asset alloc] init];
            
            // Give it an interesting label
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop #%d", i];
            [asset setLabel:currentLabel];
            [asset setResaleValue:i * 17];
            
            // Get a random number between 0 and 9 inclusive (number of employees)
            int randomIndex = arc4random_uniform(10);
            
            // Assign asset to that employee
            [[employees objectAtIndex:randomIndex] addAssetsObject:asset];
            
            [allAssets addObject:asset];
        }
        
        // Sort employees array by valueOfAssets, and then by employeeID
        [employees sortUsingDescriptors:[NSArray arrayWithObjects:
                                         [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES],
                                         [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES],
                                         nil]];
        
        
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        
        NSLog(@"allAssets: %@", allAssets);
        
        NSLog(@"Giving up ownership of array");
        allAssets = nil;
        employees = nil;
        
    }

    return 0;
}
