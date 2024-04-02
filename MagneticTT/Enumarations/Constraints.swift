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
        static let baseOffset24: CGFloat = 24
        static let baseOffset40: CGFloat = 40
        static let baseOffset16: CGFloat = 16
        static let baseOffset18: CGFloat = 18
        static let baseOffset36: CGFloat = 36
        static let baseOffset8: CGFloat = 8
        static let baseOffset9: CGFloat = 9
        static let baseOffset10: CGFloat = 10
        static let circleSize: CGFloat = 32
        static let detailedViewHeight: CGFloat = 294
        static let quantityOfDevice: CGFloat = -60
        static let minimumInteritemSpacing: CGFloat = 38
        static let minimumLineSpacing: CGFloat = 35
        static let dividerForMainImage: CGFloat = 1.185
        static let circleGradientDividerHeight: CGFloat = 1.944
        static let customMainViewDividerHeight: CGFloat = 1.76
        static let customResultViewDividerHeight: CGFloat = 6.48
        static let categoryImageDividerHeight: CGFloat = 3.18
        static let categoryImageDividerWidth: CGFloat = 1.32
    }
    
    enum Calculated {
        static let customMainViewTopOffset = uiscreenHeight / 16.88
        static let generalButtonHeight = uiscreenHeight / 16.88
        static let generalButtonOffset = uiscreenHeight / 23.44
        static let circleGradientTopOffset = uiscreenHeight / 13.61
        static let circleGradientTopOffsetSE = uiscreenHeight / 23
        static let searchCheckingLabelTopOffset = uiscreenHeight / 17.95
        static let stackViewNetworkTopOffset = uiscreenHeight / 12.98
        static let animationViewTopOffset = uiscreenHeight / 11.88
        static let quantityLabelTopOffset = uiscreenHeight / 26.375
        static let tableViewTopOffset = uiscreenHeight / 21.1
        static let customViewTopOffset = uiscreenHeight / 26.375
        static let detailedViewSideOffset = uiscreenWidth / 19.5
        static let mainScreenCellHorizontalOffset = uiscreenWidth / 21
        static let mainScreenCellVerticalOffset = uiscreenHeight / 60
        static let stackViewHorizontalOffset = uiscreenHeight / 24.375
        static let stackViewVerticalOffset = uiscreenHeight / 35.16
        static let stackViewSustomSpacing16 = uiscreenHeight / 52.75
        static let stackViewSustomSpacing8 = uiscreenHeight / 105.5
    }
}
