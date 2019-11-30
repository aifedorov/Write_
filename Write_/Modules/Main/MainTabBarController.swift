//
//  MainTabBarController.swift
//  Write_
//
//  Created by Александр Федоров on 30.11.2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

final class MainTabBarController: DisposableTabBarController, Storyboarded {

    private let documentsCoordinator = DocumentsCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()
        documentsCoordinator.start()
        viewControllers = [documentsCoordinator.navigationController]
    }
}
