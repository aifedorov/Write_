//
//  UICollectionView+Register.swift
//  Write_
//
//  Created by Александр Федоров on 05.04.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register(_ anyClasses: [UICollectionViewCell.Type]) {
        for anyClass in anyClasses {
            let reuseIdentifier = String(describing: anyClass.self)
            let nib = UINib(nibName: reuseIdentifier, bundle: nil)
            register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ anyClass: T.Type, indexPath: IndexPath) -> T {
        let reuseIdentifier = String(describing: anyClass.self)
        return dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! T
    }
}
