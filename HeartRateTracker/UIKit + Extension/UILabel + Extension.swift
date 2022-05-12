//
//  UILabel + Extension.swift
//  HeartRateTracker
//
//  Created by Сергей on 12.05.2022.
//

import UIKit

// custom init with text in label
extension UILabel {
    convenience init(textLabel: String, font: UIFont) {
        self.init()
        self.text = textLabel
        self.font = font
    }
}
