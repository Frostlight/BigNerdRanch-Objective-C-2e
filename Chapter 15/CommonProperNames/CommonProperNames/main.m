//
//  main.m
//  CommonProperNames
//
//  Created by Vincent on 3/21/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Read in the files as huge strings (ignoring the possibility of an error)
        // nameString contains proper names
        NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        
        // wordString contains both proper names and regular words
        NSString *wordString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        
        // Break them into arrays of strings
        NSArray *names = [nameString componentsSeparatedByString:@"\n"];
        NSArray *words = [wordString componentsSeparatedByString:@"\n"];
        
        // Find strings contained in both names and words
        // with a nested for loop
        for (NSString *name in names) {
            // Look for matching strings in words (case insensitive result by converting name to lowercase
            // and searching)
            if ([words containsObject:[name lowercaseString]]) {
                NSLog(@"%@", name);
            }
            
            // Alternative solution with nested for loop
            /* for (NSString *word in words) {
                if ([name caseInsensitiveCompare:word] == NSOrderedSame) {
                    NSLog(@"%@", name);
                    break;
                }
            } */
        }
    }
    return 0;
}
