//
//  UILabel+PersonsExam.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import UIKit

/// Category for UILabel helper functions
extension UILabel {
    /// A helper function for setting up the normal properties of the label.
    /// This means that the label has no special attributes.
    /// This uses the system font.
    func setup(_ text: String, fontSize: CGFloat, weight: UIFont.Weight = .regular, italic: Bool = false, textColor: UIColor = .darkGray, numberOfLines: Int = 1, textAlignment: NSTextAlignment = .natural) {
        self.font = italic ? UIFont.italicSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize, weight: weight)
        self.text = text
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}
