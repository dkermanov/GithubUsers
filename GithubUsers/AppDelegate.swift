//
//  AppDelegate.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties

    public var window: UIWindow?
    
    private var appCoordinator: Coordinator?
    
    // MARK: - Functions

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let navController = UINavigationController()
        appCoordinator = AppCoordinator(navController)
        appCoordinator?.start()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }
}

