//
//  Document.h
//  TahDoodle
//
//  Created by Vincent on 4/16/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument <NSTableViewDataSource> {
    NSMutableArray *todoItems;
    IBOutlet NSTableView *itemTableView;
}

- (IBAction)createNewItem:(id)sender;

@end

