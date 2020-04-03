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
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: className, bundle: Bundle.main)
        
        return storyboard.instantiateInitialViewController() as! Self
    }
}
