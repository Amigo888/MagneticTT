//
//  UINavigationController+CustomNavBar.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

extension UINavigationController {
    func customizeNavigationBar(
        titleColor: UIColor = .white,
        titleFont: UIFont = Resources.Font.robotoRegular(17),
        backTitle: String = "",
        backColor: UIColor = .customPurpleLight ?? .white,
        backFont: UIFont = Resources.Font.robotoRegular(17),
        backKern: CGFloat = -0.41
    ) {
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: titleColor,
            NSAttributedString.Key.font: titleFont,
            NSAttributedString.Key.kern: -0.41
        ]
        
        let backButton = UIBarButtonItem()
        backButton.title = backTitle
        backButton.tintColor = backColor
        let attributes: [NSAttributedString.Key: Any] = [
            .font: backFont,
            .kern: backKern
        ]
        backButton.setTitleTextAttributes(attributes, for: .normal)
        self.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
