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
        navigationController.tabBarItem = UITabBarItem(title: R.string.localizable.mainTabBarItemTitleDocuments(),
                                                       image: R.image.documentsTabIcon(),
                                                       tag: 0)
    }
}
