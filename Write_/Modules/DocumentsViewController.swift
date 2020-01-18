//
//  DocumentsViewController.swift
//  Write_
//
//  Created by Александр Федоров on 30.11.2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

final class DocumentsViewController: DisposableViewController, Storyboarded {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        navigationItem.titleView = LogoImageView(tintColor: .white)
    }
}
