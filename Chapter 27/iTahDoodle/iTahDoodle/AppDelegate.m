//
//  AppDelegate.m
//  iTahDoodle
//
//  Created by Vincent on 4/8/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "AppDelegate.h"

// Helper function to fetch the path to our to-do data stored on disk
// docPath is declared above since it is not part of the class
// Implementation of the class begins at the @interface line
NSString *docPath(void) {
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                            NSUserDomainMask, TRUE);
    return [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"data.td"];
}

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)addTask:(id)sender {
    // Get the to-do item
    NSString *t = [taskField text];
    
    // Quit here if taskField is empty
    if ([t isEqualToString:@""]) {
        return;
    }
    
    // Add it to our working array
    [tasks addObject:t];
    // Refresh the table so that the new item shows up
    [taskTable reloadData];
    // and clear out the text field
    [taskField setText:@""];
    // Dismiss the keyboard
    [taskField resignFirstResponder];
}

#pragma mark - Application Delegate callbacks

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Attempt to load an existing to-do dataset from an array stored to disk
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        // If there was a dataset available, copy into instance variable
        tasks = [plist mutableCopy];
    } else {
        // Otherwise, create an empty one
        tasks = [[NSMutableArray alloc] init];
    }
    
    // Add some data directly (testing)
    if ([tasks count] == 0) {
        [tasks addObject:@"Walk the dogs"];
        [tasks addObject:@"Feed the hogs"];
        [tasks addObject:@"Chop the logs"];
    }
    
    // Create and configure the UIWindow instance
    // A CGRect is a struct with an origin (x,y) and size (width, height)
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:windowFrame];
    [self setWindow:theWindow];
    
    // Define the frame rectangles of the three UI elements
    // CGRectMake() creates a CGRect from (x, y, width, height)
    CGRect tableFrame = CGRectMake(0, 80, 320, 380);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    // Create and configure the table view
    taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Make this object the table view's datasource
    [taskTable setDataSource:self];
    
    // Create and configure the text view where new tasks will be typed
    taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    [taskField setBorderStyle: UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task, tap Insert"];
    
    // Create and configure a rounded rect Insert button
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonFrame];
    
    // Buttons behave using a target/action callback
    // Configure the Insert button's action to call this object's -addTask: method
    [insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    // Give this button a title
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    // Init View Controller
    ViewController *vc = [[ViewController alloc] init];
    [[self window] setRootViewController:vc];
    
    // Add the three UI elements to the window
    [self.window.rootViewController.view addSubview:taskTable];
    [self.window.rootViewController.view addSubview:taskField];
    [self.window.rootViewController.view addSubview:insertButton];
    
    // Finalize the window and put it on the screen
    [[self window] setBackgroundColor:[UIColor whiteColor]];
    [[self window] makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    // This method is only called in iOS 4.0+
    // Save our tasks array to disk
    [tasks writeToFile:docPath() atomically:TRUE];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    // This method is only called in iOS versions PRIOR to 4.0
    // Save our tasks array to disk
    [tasks writeToFile:docPath() atomically:TRUE];
}

#pragma mark - Table View Management

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    // Because this table view only has one section,
    // the number of rows in it is equal to the number
    // of items in our tasks array
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // To improve performance, we reconfigure cells in memory
    // that have scrolled off the screen and hand them back
    // with new contents instead of always creating new cells.
    // First, we check to see if there's a cell available for reuse
    UITableViewCell *cell = [taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        // ... and only allocate a new cell if none are available
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"Cell"];
    }
    
    // Then we (re)configure the cell based on the model object,
    // in this case our todoItems array
    NSString *item = [tasks objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:item];
    
    // and hand back to the table view the properly configured cell
    return cell;
}

@end
