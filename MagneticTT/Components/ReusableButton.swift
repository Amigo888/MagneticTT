//
//  ReusableButton.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

final class ReusableButton: UIButton {
    
    // MARK: - Init
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Method
    
    private func configureButton() {
        setTitleColor(.white, for: .normal)
        titleLabel?.font = Resources.Font.robotoMedium(20)
        layer.cornerRadius = 25
        backgroundColor = .customPurpleLight
        guard let labelText = titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(
            .kern, value: 0.38,
            range: NSRange(location: .zero, length: attributedString.length)
        )
        titleLabel?.attributedText = attributedString
    }
}
