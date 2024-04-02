//
//  Constraints.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

let uiscreenWidth = UIScreen.main.bounds.width
let uiscreenHeight = UIScreen.main.bounds.height

enum Constraints {
    enum Fixed {
        static let baseOffset20: CGFloat = 20
        static let baseOffset16: CGFloat = 16
        static let baseOffset18: CGFloat = 18
        static let baseOffset8: CGFloat = 8
        static let circleSize: CGFloat = 32
        static let minimumInteritemSpacing: CGFloat = 38
        static let minimumLineSpacing: CGFloat = 35
        static let dividerForMainImage: CGFloat = 1.185
        static let circleGradientDividerHeight: CGFloat = 1.944
        static let customMainViewDividerHeight: CGFloat = 1.76
    }
    
    enum Calculated {
        static let customMainViewTopOffset = uiscreenHeight / 16.88
        static let generalButtonHeight = uiscreenHeight / 16.88
        static let seacrhMagmeticButtonOffset = uiscreenHeight / 23.44
        static let circleGradientTopOffset = uiscreenHeight / 13.61
        static let circleGradientTopOffsetSE = uiscreenHeight /  23
        static let searchCheckingLabelTopOffset = uiscreenHeight / 17.95
    }
}

enum Value {
    static let base2: Int = 2
    static let deviceDiagonal: Double = 5.4
}
