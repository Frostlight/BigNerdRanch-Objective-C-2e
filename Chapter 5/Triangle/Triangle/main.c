//
//  main.c
//  Triangle
//
//  Created by Vincent on 3/9/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#include <stdio.h>

// Calculates the third angle of a triangle, given the other two angles
float remainingAngle(float angleA, float angleB) {
    return 180 - angleA - angleB;
}

int main(int argc, const char * argv[]) {
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA, angleB);
    printf("The third angle is %f degrees\n", angleC);
    return 0;
}
