//
//  AppDelegate.m
//  SinchParseNoPod
//
//  Created by christian jensen on 3/3/15.
//  Copyright (c) 2015 christian jensen. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface AppDelegate ()
{
    id<SINClient> client;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Parse setApplicationId:@"bKAMypGbYbku0HlJGrMYWpjhlYCLtVUyLDLgcH8y"
                  clientKey:@"wgmgwGbo7KA2emJdzTQKqH6UyMGJo4lxU2TOrJUi"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    client = [Sinch clientWithApplicationKey:@"1aaad909-3858-413f-a947-31166c643c11" applicationSecret:@"G7IL68UdUUyN0rSE1yWi1w==" environmentHost:@"sandbox.sinch.com" userId:@"mycoolusername"];
    client.delegate = self;
    [client setSupportCalling:YES];
    [client start];

    
    return YES;
}

-(void)client:(id<SINClient>)client logMessage:(NSString *)message area:(NSString *)area severity:(SINLogSeverity)severity timestamp:(NSDate *)timestamp
{
    NSLog(@"%@", message);
}
-(void)clientDidStart:(id<SINClient>)client
{
    NSLog(@"client started");
}
-(void)clientDidFail:(id<SINClient>)client error:(NSError *)error
{
    NSLog(@"client failed %@", error );
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
