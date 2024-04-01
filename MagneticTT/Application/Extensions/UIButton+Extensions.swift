//
//  UIButton+Extensions.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 01.04.2024.
//

import UIKit

extension UIButton {
    
    convenience init(
        title: String? = nil,
        backgroundColor: UIColor? = nil,
        titleColor: UIColor? = nil,
        font: UIFont? = nil,
        cornerRadius: CGFloat? = nil,
    ) {
        self.init(type: .custom)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = font
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius ?? 0
    }
}
