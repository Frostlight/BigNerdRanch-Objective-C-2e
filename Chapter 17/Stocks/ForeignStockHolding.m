//
//  ForeignStockHolding.m
//  Stocks
//
//  Created by Vincent on 3/22/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "ForeignStockHolding.h"

@implementation ForeignStockHolding

@synthesize conversionRate;

// Designated Initializer
- (id)initWithName:(NSString*)theName
purchaseSharePrice:(float)thePurchaseSharePrice
 currentSharePrice:(float)theCurrentSharePrice
    numberOfShares:(int)theNumberOfShares
    conversionRate:(float)theConversionRate {
    if (self = [super init]) {
        name = [theName copy];
        purchaseSharePrice = thePurchaseSharePrice;
        currentSharePrice = theCurrentSharePrice;
        numberOfShares = theNumberOfShares;
        conversionRate = theConversionRate;
    }
    return self;
}

// Instance methods of superclass
// Overwritten to take into account the conversionRate
- (float)costInDollars {
    return purchaseSharePrice * numberOfShares * conversionRate;
}

- (float)valueInDollars {
    return currentSharePrice * numberOfShares * conversionRate;
}


@end
