//
//  main.c
//  CountBackwards
//
//  Created by Vincent on 3/13/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // Count backwards from 99 through 0 by 3, printing each number
    // if the number is divisible by 5, also print "Found one!"
    for (int i = 99; i >= 0; i -= 3) {
        printf("%d\n", i);
        
        if (i % 5 == 0)
            printf("Found one!\n");
    }
    
    return 0;
}
