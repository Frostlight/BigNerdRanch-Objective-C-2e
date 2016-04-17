//
//  Document.m
//  TahDoodle
//
//  Created by Vincent on 4/16/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

#pragma mark - Document Overrides

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    
    // Hand the caller an NSData object wrapping the data so that it can be written to disk
    
    // If there's no array, create an empty one
    if (!todoItems) {
        todoItems = [NSMutableArray array];
    }
    
    // Pack the todoItems into a data object
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:todoItems
                                                              format:NSPropertyListXMLFormat_v1_0
                                                             options:0
                                                               error:outError];
    
    // Return packed data object
    return data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    
    // Pull the data out from an NSData object
    // Extract todoItems
    todoItems = [NSPropertyListSerialization propertyListWithData:data
                                                          options:NSPropertyListMutableContainers
                                                           format:NULL
                                                            error:outError];
    
    // Return success or failure depending on the result of the above call
    return (todoItems != nil);
}

#pragma mark - Actions

- (IBAction)createNewItem:(id)sender {
    // If there's no data store array yet, create one
    if (!todoItems) {
        todoItems = [NSMutableArray array];
    }
    
    
    [todoItems addObject:@"New Item"];
    
    // reloadData refreshes (asks for updated data from dataSource)
    // dataSource here is itself, the Document Object
    [itemTableView reloadData];
    
    // updateChangeCount tells the application whether or not the
    // document has unsaved changes. NSChangeDone = unsaved
    [self updateChangeCount:NSChangeDone];
}

#pragma mark Data Source Methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView {
    // This table view is meant to display the todoItems,
    // so the number of entries in the table view will be the same
    // as the number of objects in the array.
    
    // If array does not exist, the table is empty
    if (!todoItems)
        return 0;
    
    return [todoItems count];
}

- (id)tableView:(NSTableView *)aTableView
objectValueForTableColumn:(NSTableColumn *)aTableColumn
            row:(NSInteger)rowIndex {
    // Return the item from todoItems that corresponds to the cell
    // that the tableView wants to display
    return [todoItems objectAtIndex:rowIndex];
}

- (void)tableView:(NSTableView *)aTableView
   setObjectValue:(id)anObject
   forTableColumn:(NSTableColumn *)aTableColumn
              row:(NSInteger)rowIndex {
    // When the user changes a to-do item on the tableView,
    // update the toDo items array
    [todoItems replaceObjectAtIndex:rowIndex withObject:anObject];
    // Then flag the document as having unsaved changes
    [self updateChangeCount:NSChangeDone];
}



@end
