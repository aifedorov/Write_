//
//  DocumentCell.swift
//  Write_
//
//  Created by Александр Федоров on 09.02.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

final class DocumentCell: UICollectionViewCell {
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var pageCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor.DocumentCell.backgroud
        
        titleLabel.font = R.font.playfairDisplayBold(size: 17)
        titleLabel.textColor = UIColor.DocumentCell.title
        
        dateLabel.font = UIFont.systemFont(ofSize: 11)
        titleLabel.textColor = UIColor.DocumentCell.date
        
        pageCountLabel.font = UIFont.systemFont(ofSize: 11)
        titleLabel.textColor = UIColor.DocumentCell.pageCount
        
        layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
    
    func configure(_ displayData: DocumentItemDisplayData) {
        titleLabel.text = displayData.title
        dateLabel.text = displayData.createdOn
        pageCountLabel.text = displayData.pageCount
    }
    
    private func reset() {
        titleLabel.text = nil
        dateLabel.text = nil
        pageCountLabel.text = nil
    }
}
