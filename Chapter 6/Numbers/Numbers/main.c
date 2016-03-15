//
//  main.c
//  Numbers
//
//  Created by Vincent on 3/13/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, const char * argv[]) {
    // Base 10 number
    unsigned long x = 150;
    printf("In decimal (base 10), x is %lu\n", x);
    
    // Octal and hex already assumed the number was unsigned
    printf("In octal (base 8), x is %lo\n", x);
    printf("In hexadecimal (base 16), x is %lx\n", x);
    
    // A calculation, result should be 19
    // Arithmatic follows standard precedence rules (* and / before + and -)
    printf("3 * 3 = 5 * 2 = %d\n", 3 * 3 + 5 * 2);
    
    // Integer division works like in other languages (trims off decimal places)
    // Modulus (% operater) gives the remainder
    printf("11 / 3 = %d, remainder of %d\n", 11 / 3, 11 % 3);
    
    // We can keep decimal places when dividing integers by casting
    // numerator or denominator (or both)
    printf("11 / 3 = %f\n", 11/(float)3);
    
    // Absolute value function abs() contained in stdlib.h
    printf("The absolute value of -5 is %d\n", abs(-5));
    
    // Use %e for scientific notation representation
    // Use %.xf to limit digits in floating point representation to x places after
    // the decimal point
    double y = 12345.6789;
    printf("In regular notation, y is %.2f\n", y);
    printf("In scientific notation, y is %.2e\n", y);
    
    // math.h library is a good reference for more specific math functions
    // Display the sine of 1 radian, rounded to three decimal points
    printf("Sine of 1 radian is %.3f\n", sin(1));
    
    return 0;
}
