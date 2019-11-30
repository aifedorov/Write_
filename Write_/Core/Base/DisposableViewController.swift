//
//  DisposableViewController.swift
//  Write_
//
//  Created by Александр Федоров on 30.11.2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import RxSwift
import UIKit

class DisposableViewController: UIViewController {
    var disposeBag = DisposeBag()
}

class DisposableTabBarController: UITabBarController {
    var disposeBag = DisposeBag()
}

class DisposableNavigationController: UINavigationController {
    var disposeBag = DisposeBag()
}
