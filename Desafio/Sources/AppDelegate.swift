//
//  AppDelegate.swift
//  Desafio
//
//  Created by Gabriel Carvalho on 03/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let MovieListViewController = MovieListViewController()
        let navigationController = UINavigationController(rootViewController: MovieListViewController)

        window?.rootViewController = navigationController
        
        return true
    }
    
    


}

