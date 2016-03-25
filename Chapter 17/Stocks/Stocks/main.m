//
//  main.m
//  Stocks
//
//  Created by Vincent on 3/22/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForeignStockHolding.h"
#import "Portfolio.h"

// Create a StockHolding with the specified values, and return it
StockHolding *createStock (NSString *name, float purchaseSharePrice,
                           float currentSharePrice, int numberOfShares) {
    return [[StockHolding alloc] initWithName:name
                           purchaseSharePrice:purchaseSharePrice
                            currentSharePrice:currentSharePrice
                               numberOfShares:numberOfShares];
}

// Create a ForeignStockHolding with the specified values, and return it
ForeignStockHolding *createForeignStock (NSString *name, float purchaseSharePrice,
                           float currentSharePrice, int numberOfShares, float conversionRate) {
    return [[ForeignStockHolding alloc] initWithName:name
                           purchaseSharePrice:purchaseSharePrice
                            currentSharePrice:currentSharePrice
                               numberOfShares:numberOfShares
                               conversionRate:conversionRate];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Fill an array with a few stock holding records
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:createStock(@"Cheap Stock", 5.0, 6.0, 1000)];
        [array addObject:createStock(@"Mid range Stock", 25.0, 31.0, 5000)];
        [array addObject:createStock(@"Expensive Stock", 90.0, 101.0, 75000)];
        [array addObject:createStock(@"Misc Stock A", 50.0, 60.0, 25000)];
        [array addObject:createStock(@"Misc Stock B", 20.0, 40.0, 15000)];
        [array addObject:createForeignStock(@"Foreign Stock", 100.0, 100.0, 10000, 1.5)];
        
        // Iterate through array and print each stock's properties
        for (StockHolding *stockHolding in array) {
            NSLog(@"Name: %@, Purchase price: %.2f, Current price: %.2f, Cost: %.2f, Value: %.2f, Number of Shares: %d",
                  [stockHolding name], [stockHolding purchaseSharePrice], [stockHolding currentSharePrice],
                  [stockHolding costInDollars], [stockHolding valueInDollars], [stockHolding numberOfShares]);
        }
        
        // Create a portfolio object and fill it with two of the stock holdings
        Portfolio *portfolio = [[Portfolio alloc] init];
        [portfolio addStockHolding:[array objectAtIndex:0]];
        [portfolio addStockHolding:[array objectAtIndex:1]];

        // Log the total value of the portfolio
        NSLog(@"Total value of portfolio: %.2f", [portfolio totalValue]);
        
    }
    return 0;
}
