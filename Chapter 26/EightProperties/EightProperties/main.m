//
//  main.m
//  EightProperties
//
//  Created by Vincent on 4/8/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

// A propertylist with one of each possible object
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *propertyList = [[NSMutableArray alloc] init];
        
        // NSArray
        [propertyList addObject:@[@"Hello", @300, @TRUE, @3]];
        
        // NSDictionary
        NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionary];
        [mutableDictionary setObject:@"AAPL" forKey:@"symbol"];
        [mutableDictionary setObject:[NSNumber numberWithInt:200] forKey:@"shares"];
        [propertyList addObject:mutableDictionary];
        
        // NSString
        NSString *string = @"I am a string";
        [propertyList addObject:string];
        
        // NSData
        NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
        [propertyList addObject:data];
        
        // NSDate
        [propertyList addObject:[NSDate date]];
    
        // NSNumber
        [propertyList addObject:[NSNumber numberWithInt:36000]];
        
        // Exports NSMutableArray as XML (by setting extension to plist)
        [propertyList writeToFile:@"/tmp/objects.plist" atomically:TRUE];
        
        NSLog(@"Done!");
    }
    return 0;
}
