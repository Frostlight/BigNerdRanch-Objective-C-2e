//
//  main.c
//  Coolness
//
//  Created by Vincent on 3/13/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int i = 0;
    
    // The while loop
    while (i < 3) {
        printf("Aaron is Cool\n");
        i++;
    }
    
    // The for loop
    for (i = 0; i < 3; i++) {
        printf("Aaron is NOT Cool\n");
    }
    
    // Other concepts covered in this chapter:
    // break, continue, do-while
    
    return 0;
}
