//
//  Logger.h
//  Callbacks
//
//  Created by Vincent on 4/3/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Logger : NSObject {
    NSMutableData *incomingData;
}

// Logs "Ouch!" when called
- (void)sayOuch:(NSTimer *)t;

@end
