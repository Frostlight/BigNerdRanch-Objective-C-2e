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
    printf("int i stores its value at %p\n", &i);
    
    // Since everything is stored in memory, everything has an address
    // including, for example, functions
    printf("This function starts at address %p\n", &main);
    
    return 0;
}
