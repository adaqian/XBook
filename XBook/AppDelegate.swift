//
//  AppDelegate.swift
//  XBook
//
//  Created by dongqian on 16/8/3.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        /**
        设置LeanCloud
        **/
        AVOSCloud.setApplicationId("pPVzCy5axKr5DIeTTteFMMEQ-gzGzoHsz", clientKey: "9dBEljP8WoDd0cYVBSWPyM0N")
        self.window = UIWindow(frame: CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT))
        
        let tabBarController = UITabBarController()
        
        let rankViewController = UINavigationController(rootViewController: RankViewController())
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let pushViewController = UINavigationController(rootViewController: PushViewController())
        let circleViewController = UINavigationController(rootViewController: CircleViewController())
        let moreViewController = UINavigationController(rootViewController: MoreViewController())
        
        tabBarController.viewControllers = [rankViewController,searchViewController,pushViewController,circleViewController,moreViewController]

        let tabBarItem1 = UITabBarItem(title: "排行榜", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        let tabBarItem2 = UITabBarItem(title: "发现", image: UIImage(named: "compass"), selectedImage: UIImage(named: "compass"))
        let tabBarItem3 = UITabBarItem(title: "", image: UIImage(named: "edit"), selectedImage: UIImage(named: "edit"))
        let tabBarItem4 = UITabBarItem(title: "圈子", image: UIImage(named: "fan"), selectedImage: UIImage(named: "fan"))
        let tabBarItem5 = UITabBarItem(title: "更多", image: UIImage(named: "setting"), selectedImage: UIImage(named: "setting"))
        rankViewController.tabBarItem = tabBarItem1
        searchViewController.tabBarItem = tabBarItem2
        pushViewController.tabBarItem = tabBarItem3
        circleViewController.tabBarItem = tabBarItem4
        moreViewController.tabBarItem = tabBarItem5
        
        rankViewController.tabBarController?.tabBar.tintColor = MAIN_RED
        
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

