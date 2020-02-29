//
//  ViewController.swift
//  Write_
//
//  Created by Александр Федоров on 30.11.2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import RxSwift
import UIKit

class ViewController: UIViewController {
    private var disposeBag = DisposeBag()
}

class TabBarController: UITabBarController {
    private var disposeBag = DisposeBag()
}

class NavigationController: UINavigationController {
    private var disposeBag = DisposeBag()
}
