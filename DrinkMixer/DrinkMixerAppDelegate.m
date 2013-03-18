//
//  DrinkMixerAppDelegate.m
//  DrinkMixer
//
//  Created by stavro on 3/13/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "DrinkMixerAppDelegate.h"
#import "DrinkMixerTableViewController.h"

@implementation DrinkMixerAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationDidEnterBackground:(UIApplication *)application
{
//    UITabBarController *tbc = (UITabBarController *)self.window.rootViewController;
//    
//    UINavigationController *nvc = [tbc.viewControllers objectAtIndex:0];
//    
//    DrinkMixerTableViewController *controller = [nvc.viewControllers objectAtIndex:0];
//
//    [controller writeDrinksToFile];

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//- (void)applicationDidEnterBackground:(UIApplication *)application
//{
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"DrinkDirectiona" ofType:@"plist"];
//    
//    
//    
//    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
//    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
