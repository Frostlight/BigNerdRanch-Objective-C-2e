//
//  main.c
//  FloatSize
//
//  Created by Vincent on 3/15/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#include <stdio.h>
#include <limits.h>

int main(int argc, const char * argv[]) {
    // The size of a float (4 bytes)
    printf("A float is %zu bytes\n", sizeof(float));
    
    // The size of a short (2 bytes) (stores -32768 to 32767)
    printf("A short is %zu bytes\n", sizeof(short));
    printf("The smallest number a short can store is %d\n", SHRT_MIN);
    printf("The largest number a short can store is %d\n", SHRT_MAX);
    printf("The largest number an unsigned short can store is %d\n", USHRT_MAX);
    
    
    return 0;
}
