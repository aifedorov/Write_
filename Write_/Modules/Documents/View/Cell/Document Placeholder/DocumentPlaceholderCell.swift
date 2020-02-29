//
//  DocumentPlaceholderCell.swift
//  Write_
//
//  Created by Александр Федоров on 09.02.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

final class DocumentPlaceholderCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        backgroundColor = UIColor.DocumentPlaceholder.background
    }
}
