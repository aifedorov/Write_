//
//  ReuseIdentifiable.swift
//  Write_
//
//  Created by Александр Федоров on 28.03.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

protocol ReuseIdentifiable {
    static func reuseIdentifier() -> String
}

extension ReuseIdentifiable {
    static func reuseIdentifier() -> String {
        String(describing: self)
    }
}

extension UICollectionViewCell: ReuseIdentifiable {}
