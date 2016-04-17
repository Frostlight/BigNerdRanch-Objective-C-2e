//
//  AppDelegate.h
//  iTahDoodle
//
//  Created by Vincent on 4/8/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

// Declare a C-helper function used to get a path to the location on disk
// where the to-do list is saved
NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource> {
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    
    NSMutableArray *tasks;
}

- (void)addTask:(id)sender;

@property (strong, nonatomic) UIWindow *window;


@end

