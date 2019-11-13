//
//  AppDelegate.swift
//  EventMapper
//
//  Created by Gordon Krull on 2017-09-28.
//  Copyright © 2017 GK. All rights reserved.
//

import CoreLocation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController
        if let initialViewController = navigationController?.topViewController as? MapViewController {
            initialViewController.eventService = RealEventService(httpService: RealHttpService())
        }
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
