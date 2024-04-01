//
//  NSShadow+Custom.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

extension NSShadow {
    static func shadowCreate() -> NSShadow {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.customPurpleLight?.withAlphaComponent(0.55)
        shadow.shadowBlurRadius = 5
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        return shadow
    }
}
