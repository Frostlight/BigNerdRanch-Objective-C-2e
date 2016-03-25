//
//  Portfolio.h
//  Stocks
//
//  Created by Vincent on 3/23/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StockHolding;

@interface Portfolio : NSObject {
    NSMutableArray *stockHoldings;
}

@property NSMutableArray *stockHoldings;

// Returns the total value of the portfolio
- (float)totalValue;

// Adds a stockHolding to the portfolio
- (void)addStockHolding:(StockHolding*)stock;
- (NSMutableArray*)getStockHoldings;

@end
