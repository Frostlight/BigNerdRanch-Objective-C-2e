//
//  Portfolio.m
//  Stocks
//
//  Created by Vincent on 3/23/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "Portfolio.h"
#import "StockHolding.h"

@implementation Portfolio

@synthesize stockHoldings;

- (float)totalValue {
    float value = 0.0;
    for (StockHolding *stockHolding in stockHoldings) {
        value += [stockHolding valueInDollars];
    }
    
    return value;
}

- (void)addStockHolding:(StockHolding*)stock {
    // Create stockHoldings array if it does not exist
    if (stockHoldings == nil) {
        stockHoldings = [NSMutableArray array];
    }
    [stockHoldings addObject:stock];
}

- (NSMutableArray*)getStockHoldings {
    return stockHoldings;
}

@end
