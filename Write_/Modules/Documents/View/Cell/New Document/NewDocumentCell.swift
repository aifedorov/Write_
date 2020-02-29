//
//  NewDocumentCell.swift
//  Write_
//
//  Created by Александр Федоров on 09.02.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class NewDocumentCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundView = UIImageView(image: R.image.newDocumentBackground())
    }
}
