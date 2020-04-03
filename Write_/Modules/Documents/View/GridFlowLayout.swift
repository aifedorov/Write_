//
//  GridFlowLayout.swift
//  Write_
//
//  Created by Александр Федоров on 03.04.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

final class GridFlowLayout: UICollectionViewFlowLayout {
    // MARK: Private Properties
    
    private let panding: CGFloat = 15
    private let maxNumColumns: CGFloat = 2
    private let cellHeight: CGFloat = 195
    
    // MARK: Lifecylce
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else {
            return
        }
        
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let cellWidth = ((availableWidth - 3 * panding) / CGFloat(maxNumColumns)).rounded(.down)
        
        itemSize = CGSize(width: cellWidth, height: cellHeight)
        sectionInset = UIEdgeInsets(top: panding,
                                    left: panding,
                                    bottom: panding,
                                    right: panding)
    }
}
