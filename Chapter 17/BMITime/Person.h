//
//  Person.h
//  BMITime
//
//  Created by Vincent on 3/22/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

// The class Person inherits all instance variables
// and methods defined by the class NSObject
@interface Person : NSObject
{
    // Two instance variables
    float heightInMeters;
    int weightInKilos;
}

// Declare both setter and getter methods with the @property construct
@property float heightInMeters;
@property int weightInKilos;

// Setter methods
// - (void)setHeightInMeters:(float)h;
// - (void)setWeightInKilos:(float)w;

// Getter methods
// - (float)heightInMeters;
// - (int)weightInKilos;

// Calculate BMI method
- (float)bodyMassIndex;

@end
