//
//  AppDelegate.swift
//  Write_
//
//  Copyright © Personal. All rights reserved.
//

import RxSwift
import UIKit

final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private var coordinator: Coordinator?
    
    // MARK: UIApplicationDelegate
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if UIApplication.isInUITest {
            UIView.setAnimationsEnabled(false)
        }
        
        setupView()
        
        #if DEBUG
            _ = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
                .subscribe(onNext: { _ in
                    print("Resource count \(RxSwift.Resources.total)")
            })
        #endif
        
        return true
    }
    
    private func setupView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
    }
}
