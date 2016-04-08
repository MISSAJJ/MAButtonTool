//
//  AppDelegate.m
//  MAButtonTool
//
//  Created by MISSAJJ on 16/4/4.
//  Copyright © 2016年 MISSAJJ. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    


    //底部菜单按钮颜色
    [[UITabBar appearance]setTintColor:[UIColor yellowColor]];
    //底部菜单背景色
    [[UITabBar appearance]setBarTintColor:[UIColor blackColor]];
    //底部菜单title 选中颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        NSForegroundColorAttributeName : [UIColor whiteColor]
                                                        } forState:UIControlStateSelected];
    
     //底部菜单title 未选中颜色 (灰色)
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        NSForegroundColorAttributeName : [UIColor colorWithRed:.5 green:.5 blue:.5 alpha:1]
                                                        } forState:UIControlStateNormal];

    
    
    //导航栏背景色
    [[UINavigationBar appearance]setBarTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance]setTitleTextAttributes:@{
                                                          NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0f],
                                                         NSForegroundColorAttributeName : [UIColor yellowColor] }];
    
    
    //statusbar颜色－白
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    return YES;
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
