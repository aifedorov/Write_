//
//  Storyboarded.swift
//  Write_
//
//  Created by Александр Федоров on 30.11.2019.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // this pulls out "App.ViewController"
        let fullName = NSStringFromClass(self)

        // this splits by the dot and uses everything after, giving "ViewController"
        let className = fullName.components(separatedBy: ".")[1]

        // load storyboard with filename "ViewController"
        let storyboard = UIStoryboard(name: className, bundle: Bundle.main)

        return storyboard.instantiateInitialViewController() as! Self
    }
}
