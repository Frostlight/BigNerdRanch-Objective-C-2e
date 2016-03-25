//
//  main.m
//  ComputerName
//
//  Created by Vincent on 3/21/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Log the computer's name
        NSHost *host = [NSHost currentHost];
        NSString *computerName = [host localizedName];
        NSLog(@"This computer's name is %@", computerName);
    }
    return 0;
}
