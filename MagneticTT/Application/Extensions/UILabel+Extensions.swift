//
//  UILabel+Extensions.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 01.04.2024.
//

import UIKit

extension UILabel {
    
    convenience init(
        text: String? = nil,
        textColor: UIColor? = nil,
        font: UIFont? = nil,
        alignment: NSTextAlignment = .center,
        numberOfLines: Int = 0,
        kern: CGFloat = -0.41
    ) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
        self.setKernValue(kern)
    }
    
    func setKernValue(_ kern: CGFloat) {
        guard let labelText = self.text else { return }
        let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(.kern, value: kern, range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }
}
