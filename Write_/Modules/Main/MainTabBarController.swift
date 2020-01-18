//
//  MainTabBarController.swift
//  Write_
//
//  Created by Александр Федоров on 30.11.2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

final class MainTabBarController: DisposableTabBarController {
    private let documentsCoordinator = DocumentsCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        documentsCoordinator.start()
        viewControllers = [documentsCoordinator.navigationController]
        
        tabBar.tintColor = .white
        tabBar.backgroundColor = UIColor.Background.dark
        tabBar.barTintColor = UIColor.Background.dark
        tabBar.isTranslucent = false
    }
}
