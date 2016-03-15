//
//  main.c
//  Addresses
//
//  Created by Vincent on 3/13/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // & operator gets a variable's address
    // %p token is used for memory addresses
    int i = 17;
    
    // Pointers are used to store addresses of variables
    int *addressOfI = &i;
    
    // printf("int i stores its value at %p\n", &i);
    printf("int i stores its value at %p\n", addressOfI);
    
    // Since everything is stored in memory, everything has an address
    // including, for example, functions
    printf("This function starts at address %p\n", &main);
    
    // Data stored at pointers can be accessed by dereferencing pointers
    // using the * operator
    printf("The integer stored at addressOfI is %d\n", *addressOfI);
    
    // The same * operator can be used to assign new values to data
    // at that particular address
    *addressOfI = 89;
    printf("Now i is %d\n", *addressOfI);
    
    // Use sizeof() to find out how much data anything uses
    // The function sizeof() returns a value of type size_t, for which
    // %zu is the correct placeholder token
    printf("An integer is %zu bytes\n", sizeof(int));
    printf("i is an integer, so it is also %zu bytes\n", sizeof(i));
    printf("A pointer is %zu bytes\n", sizeof(int *));
    
    return 0;
}
