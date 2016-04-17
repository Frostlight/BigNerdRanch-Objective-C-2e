//
//  main.m
//  Stringz
//
//  Created by Vincent on 3/28/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int i = 0; i < 10; i ++) {
            [str appendString:@"Aaron is cool!\n"];
        }
        
        // Declare a pointer to an NSError object, but don't instantiate it
        // The NSError instance only gets created if there is an error
        NSError *error = nil;
        
        /// Pass the NSError pointer by reference to the NSString method
        BOOL success = [str writeToFile:@"/tmp/cool.txt"
                             atomically:YES
                               encoding:NSUTF8StringEncoding
                                  error:&error];
        
        if (success) {
            NSLog(@"Done writing /tmp/cool.txt");
        } else {
            NSLog(@"Writing /tmp/cool.txt failed: %@", [error localizedDescription]);
        }
        
    }
    return 0;
}
