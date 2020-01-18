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
    private var disposeBag = DisposeBag()
}

class DisposableTabBarController: UITabBarController {
    private var disposeBag = DisposeBag()
}

class DisposableNavigationController: UINavigationController {
    private var disposeBag = DisposeBag()
}
