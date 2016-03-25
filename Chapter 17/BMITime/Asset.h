//
//  Asset.h
//  BMITime
//
//  Created by Vincent on 3/22/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Employee;

@interface Asset : NSObject {
    NSString *label;
    
    // __weak keyword has to be used for weak references
    __weak Employee *holder;
    unsigned int resaleValue;
}

// "strong" indicates "ownership" of the object referenced
@property (strong) NSString *label;

// "weak" indicates no "ownership" of the object referenced
// The Employee owns this asset, which makes the reference to employee here
// a weak reference
// I.e. the parent owns the child, but the child does not own the parent
@property (weak) Employee *holder; // Holder of the asset
@property unsigned int resaleValue;

@end
