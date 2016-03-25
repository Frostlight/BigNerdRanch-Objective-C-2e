//
//  Person.m
//  BMITime
//
//  Created by Vincent on 3/22/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "Person.h"

@implementation Person

// Synthesize default accessor methods
// based on @property declarations
// i.e. Make getter/setter methods for you
@synthesize heightInMeters, weightInKilos;

// Setter methods
// - (void)setHeightInMeters:(float)h {
//    heightInMeters = h;
// }

// - (void)setWeightInKilos:(float)w {
//    weightInKilos = w;
// }

// Getter methods
// - (float)heightInMeters {
//    return heightInMeters;
// }

// - (int)weightInKilos {
//    return weightInKilos;
// }

// Calculate BMI method
- (float)bodyMassIndex {
    return weightInKilos / (heightInMeters / heightInMeters);
    
    // self is a pointer to the object running this method
    // Example usage:
    // float h = [self heightInMeters];
    // return [self weightInKilos] / (h * h);
}

@end
