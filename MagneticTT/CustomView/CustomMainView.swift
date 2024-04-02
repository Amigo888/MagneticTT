//
//  CustomMainView.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

final class CustomMainView: UIView {
    
    private lazy var currentWiFiLabel = UILabel(
        text: "Current Wi-Fi",
        textColor: .white,
        font: Resources.Font.robotoRegular(15)
    )

    private lazy var wiFiNameLabel: UILabel = {
        let label = UILabel(
            text: "WIFI_Name",
            textColor: .customPurpleLight,
            font: Resources.Font.robotoBold(28)
        )
        label.addShadowToText(shadow: NSShadow.shadowCreate())
        return label
    }()

    private lazy var readyScanLabel = UILabel(
        text: "Ready to Scan this network",
        textColor: .customDarkGrey,
        font: Resources.Font.robotoRegular(17)
    )

    private lazy var scanButton: ReusableButton = {
        let button = ReusableButton(title: "Scan current network")
        button.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            currentWiFiLabel,
            wiFiNameLabel,
            readyScanLabel,
            scanButton
        ])
        stackView.setCustomSpacing(.zero, after: currentWiFiLabel)
        stackView.setCustomSpacing(UIScreen.main.bounds.height / 52.75, after: wiFiNameLabel)
        stackView.setCustomSpacing(UIScreen.main.bounds.height / 105.5, after: readyScanLabel)
        stackView.axis = .vertical
        return stackView
    }()
    
    var action: (() -> (Void))?
    
    private var stackViewHorizontalOffset: CGFloat {
        return UIScreen.main.bounds.height / 24.375
    }
    
    private var stackViewVerticalOffset: CGFloat {
        return UIScreen.main.bounds.height / 35.16
    }
    
    private var scanButtonHeight: CGFloat {
        return UIScreen.main.bounds.height / 16.88
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addViews()
        setupConstraints()
        setupCornerButtonRadius()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView() {
        layer.cornerRadius = 8
        backgroundColor = .infoWiFiBackground
    }
    
    private func addViews() {
        addSubview(stackView)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(stackViewHorizontalOffset)
            make.top.bottom.equalToSuperview().inset(stackViewVerticalOffset)
        }
        
        scanButton.snp.makeConstraints { make in
            make.height.equalTo(scanButtonHeight)
        }
    }
    
    private func setupCornerButtonRadius() {
        scanButton.layer.cornerRadius = scanButtonHeight / 2
    }
    
    @objc private func scanButtonTapped() {
        action?()
    }
}
