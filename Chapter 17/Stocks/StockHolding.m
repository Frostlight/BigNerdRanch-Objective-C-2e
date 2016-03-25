//
//  StockHolding.m
//  Stocks
//
//  Created by Vincent on 3/22/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "StockHolding.h"

@implementation StockHolding

// Synthesize accessor methods for properties (instance variables)
@synthesize name, purchaseSharePrice, currentSharePrice, numberOfShares;

// Designated Initializer
- (id)initWithName:(NSString*)theName
        purchaseSharePrice:(float)thePurchaseSharePrice
        currentSharePrice:(float)theCurrentSharePrice
        numberOfShares:(int)theNumberOfShares {
    if (self = [super init]) {
        name = [theName copy];
        purchaseSharePrice = thePurchaseSharePrice;
        currentSharePrice = theCurrentSharePrice;
        numberOfShares = theNumberOfShares;
    }
    return self;
}

// Instance methods
- (float)costInDollars {
    return purchaseSharePrice * numberOfShares;
}

- (float)valueInDollars {
    return currentSharePrice * numberOfShares;
}

@end
