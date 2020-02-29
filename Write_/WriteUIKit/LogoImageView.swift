//
//  LogoImageView.swift
//  Write_
//
//  Created by Александр Федоров on 18.01.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

final class LogoImageView: UIImageView {
    init(tintColor: UIColor) {
        let image = R.image.logo().unsafelyUnwrapped
        let size = CGSize(width: 80, height: 20)
        let newImage = UIImage.resize(image: image,
                                      targetSize: size).withRenderingMode(.alwaysTemplate)
        
        super.init(image: newImage)
        self.tintColor = tintColor
        contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 80, height: 20)
    }
}

private extension UIImage {
    static func resize(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio = targetSize.width / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage.unsafelyUnwrapped
    }
}
