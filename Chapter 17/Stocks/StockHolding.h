//
//  StockHolding.h
//  Stocks
//
//  Created by Vincent on 3/22/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockHolding : NSObject {
    NSString *name;
    float purchaseSharePrice;
    float currentSharePrice;
    int numberOfShares;
}

// Create properties for instance variables
@property NSString *name;
@property float purchaseSharePrice, currentSharePrice;
@property int numberOfShares;

// Designated Initializer
- (id)initWithName:(NSString*)theName
purchaseSharePrice:(float)thePurchaseSharePrice
 currentSharePrice:(float)theCurrentSharePrice
    numberOfShares:(int)theNumber;

// Instance methods
- (float)costInDollars; // purchaseSharePrice * numberOfShares
- (float)valueInDollars; // currentSharePrice * numberOfShares

@end
