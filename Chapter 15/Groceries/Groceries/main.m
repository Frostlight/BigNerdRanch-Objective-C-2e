//
//  main.m
//  Groceries
//
//  Created by Vincent on 3/21/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Add groceries (NSStrings) to an NSMutableArray
        NSMutableArray *groceries = [NSMutableArray array];
        [groceries addObject:@"Apples"];
        [groceries addObject:@"Eggs"];
        [groceries addObject:@"Oranges"];
        [groceries addObject:@"Fish"];
        
        // Print each grocery item, starting from 1
        for (int i = 0; i < [groceries count]; i++) {
            NSLog(@"Grocery item #%d: %@", i + 1, [groceries objectAtIndex:i]);
        }
    }
    return 0;
}
