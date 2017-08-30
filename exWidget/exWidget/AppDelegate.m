//
//  AppDelegate.m
//  exWidget
//
//  Created by Yeongeun Song on 2017. 8. 24..
//  Copyright © 2017년 Yeongeun Song. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "Page01ViewController.h"
#import "Page02ViewController.h"
#import "Page03ViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainViewController *mainViewController = storyboard.instantiateInitialViewController;
    
    self.mainController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    self.window.rootViewController = self.mainController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    if([[url host] isEqualToString:@"page"]){
        if([[url path] isEqualToString:@"/main"]){
            [self.mainController setViewControllers:@[[[UIViewController alloc] init]] animated:YES];
            [self.mainController setNavigationBarHidden:YES];
        }
        else if([[url path] isEqualToString:@"/page01"]){
            [self.mainController pushViewController:[[Page01ViewController alloc] init] animated:YES];
            [self.mainController setNavigationBarHidden:YES];
        }
        else if([[url path] isEqualToString:@"/page02"]){
            [self.mainController pushViewController:[[Page02ViewController alloc] init] animated:YES];
            [self.mainController setNavigationBarHidden:YES];
        }
        else if([[url path] isEqualToString:@"/page03"]){
            [self.mainController pushViewController:[[Page03ViewController alloc] init] animated:YES];
            [self.mainController setNavigationBarHidden:YES];
        }
        return YES;
    }
    else{
        return NO;
    }
}



@end
