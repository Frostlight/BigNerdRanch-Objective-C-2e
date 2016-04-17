//
//  Logger.m
//  Callbacks
//
//  Created by Vincent on 4/3/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "Logger.h"

@implementation Logger

- (void)sayOuch:(NSTimer *)t {
    NSLog(@"Ouch!");
}

// Called each time a chunk of data arrives
- (void)connection:(NSURLConnection *)connection
    didReceiveData:(nonnull NSData *)data {
    NSLog(@"Received %lu bytes", [data length]);
    
    // Create a mutable data if it doesn't exist yet
    if (!incomingData) {
        incomingData = [[NSMutableData alloc] init];
    }
    
    [incomingData appendData:data];
}

// Called when the last chunk has been processed
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Got it all");
    
    NSString *string = [[NSString alloc] initWithData:incomingData
                                             encoding:NSUTF8StringEncoding];
    incomingData = nil;
    NSLog(@"String has %lu characters", [string length]);
    
    // Uncomment the next line to se the entire fetched file
    // NSLog(@"The whole string is %@", string);
}

// Called if the fetch fails
- (void)connection:(NSURLConnection *)connection
  didFailWithError:(nonnull NSError *)error {
    NSLog(@"Connection failed: %@", [error localizedDescription]);
    incomingData = nil;
}

// Called when the time zone changes
- (void)zoneChange:(NSNotification *)note {
    NSLog(@"The time zone changed!");
}

@end
