//
//  UIColor+colors.swift
//  Write_
//
//  Created by Александр Федоров on 18.01.2020.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

extension UIColor {
    enum Background {
        static let dark = UIColor(hexString: "#151515", alpha: 0.95)
    }
}

private extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        // Convert hex string to an integer
        let hexint = Int(UIColor.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xFF) >> 0) / 255.0
        
        // Create color object, specifying alpha as well
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    private static func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
}
