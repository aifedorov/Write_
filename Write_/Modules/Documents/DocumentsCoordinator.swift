//
//  DocumentsCoordinator.swift
//  Write_
//
//  Created by Александр Федоров on 30.11.2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

final class DocumentsCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        debugPrint(navigationController.navigationItem)
        
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        
        navigationController.tabBarItem = UITabBarItem(title: R.string.localizable.mainTabBarItemTitleDocuments(),
                                                       image: R.image.documentsTabIcon(),
                                                       tag: 0)
        
        navigationController.viewControllers = [DocumentsViewController.instantiate()]
    }
}
