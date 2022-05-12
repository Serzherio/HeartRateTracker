//
//  UIFont + Extension.swift
//  HeartRateTracker
//
//  Created by Сергей on 12.05.2022.
//

import UIKit

// extension for UIFont class to add new font for project
// font - Noteworthy, size - 30
// font - Noteworthy, size - 24
extension UIFont {
    static func noteworthy50() -> UIFont {
        return self.init(name: "Noteworthy", size: 50)!
    }
    static func noteworthy30() -> UIFont {
        return self.init(name: "Noteworthy", size: 30)!
    }
    static func noteworthy24() -> UIFont {
        return self.init(name: "Noteworthy", size: 24)!
    }
    static func noteworthy20() -> UIFont {
        return self.init(name: "Noteworthy", size: 20)!
    }
    static func noteworthy18() -> UIFont {
        return self.init(name: "Noteworthy", size: 18)!
    }
}
