//
//  main.m
//  Constants
//
//  Created by Vincent on 3/25/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // In literal NSString, use \u for arbitrary unicode chars
        // M_PI is a system float constant for PI
        NSLog(@"\u03c0 is %f", M_PI);
        
        // Example usage of the MAX predefined macro
        NSLog(@"%d is larger", MAX(10, 12));
        
        // Global variables example
        NSLocale *here = [NSLocale currentLocale];
        NSLog(@"Money for this locale is %@", [here objectForKey:NSLocaleCurrencyCode]);
    }
    return 0;
}
