//
//  main.m
//  Readz
//
//  Created by Vincent on 3/29/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSError *error = nil;
        NSString *str = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf"
                                                        encoding:NSASCIIStringEncoding
                                                           error:&error];
        
        if (!str) {
            NSLog(@"Read failed: %@", [error localizedDescription]);
        } else {
            NSLog(@"Read success. Contents: %@", str);
        }
    }
    return 0;
}
