//
//  ForeignStockHolding.h
//  Stocks
//
//  Created by Vincent on 3/22/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StockHolding.h"

@interface ForeignStockHolding : StockHolding {
    float conversionRate;
}

@property float conversionRate;

// Designated Initializer
- (id)initWithName:(NSString*)theName
purchaseSharePrice:(float)thePurchaseSharePrice
 currentSharePrice:(float)theCurrentSharePrice
    numberOfShares:(int)theNumber
    conversionRate:(float)theConversionRate;

@end
