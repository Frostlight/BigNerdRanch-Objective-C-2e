//
//  main.c
//  PBR
//
//  Created by Vincent on 3/15/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#include <stdio.h>
#include <math.h>

void cartesianToPolar(float x, float y, double *rPtr, double *thetaPtr) {
    // Store the radius in the supplied address
    if (rPtr) {
        *rPtr = sqrt(x * x + y * y);
    }
    
    // Calculate Theta
    float theta;
    
    if (thetaPtr) {
        if (x == 0.0) {
            if (y == 0.0) {
                theta = 0.0; // Technically considered undefined
            } else if (y > 0) {
                theta = M_PI_2;
            } else {
                theta = - M_PI_2;
            }
        } else {
            theta = atan(y/x);
        }
    }
    
    // Store theta in the supplied address
    *thetaPtr = theta;
}

int main(int argc, const char * argv[]) {
    // A demonstration of the modf function
    // Showcasing passing by reference
    double pi = 3.14;
    double integerPart, fractionPart;
    
    // Pass the address of integerPart as an argument
    fractionPart = modf(pi, &integerPart);
    
    // Find the value stored in integerPart
    printf("integerPart: %.0f, fractionPart: %.2f\n", integerPart, fractionPart);
    
    // Convert rectangular to radians
    double x = 3.0;
    double y = 4.0;
    double radius, angle;
    
    cartesianToPolar(x, y, &radius, &angle);
    printf("(%.2f, %.2f) becomes (%.2f radians, %.2f)\n", x, y, radius, angle);
    return 0;
}
