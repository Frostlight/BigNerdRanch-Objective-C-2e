//
//  main.c
//  TwoFloats
//
//  Created by Vincent on 3/4/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // Declare two arbitrary floats and give values to them
    float pie = 3.14;
    float e = 2.71;
    
    // Add the floats together and log it
    double sum = pie + e;
    printf("%f + %f = %f\n", pie, e, sum);
    return 0;
}
