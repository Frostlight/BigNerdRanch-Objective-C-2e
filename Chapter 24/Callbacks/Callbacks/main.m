//
//  main.m
//  Callbacks
//
//  Created by Vincent on 4/3/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Logger *logger = [[Logger alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:logger
                                                 selector:@selector(zoneChange:)
                                                     name:NSSystemTimeZoneDidChangeNotification
                                                   object:nil];
        
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        // Ignore deprecated warnings
        // This is just for learning purposes so it's okay
        #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request
                                                                              delegate:logger
                                                                      startImmediately:TRUE];

        
        // __unused flags a variable as purposely unused to ignore the "unused" warning
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                          target:logger
                                                        selector:@selector(sayOuch:)
                                                        userInfo:nil
                                                         repeats:TRUE];
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
