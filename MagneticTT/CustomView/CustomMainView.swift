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
        stackView.setCustomSpacing(0, after: currentWiFiLabel)
        stackView.setCustomSpacing(16, after: wiFiNameLabel)
        stackView.setCustomSpacing(8, after: readyScanLabel)
        stackView.axis = .vertical
        return stackView
    }()
    
    var action: (() -> (Void))?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addViews()
        setupConstraints()
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
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(24)
        }
        
        scanButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    @objc private func scanButtonTapped() {
        action?()
    }
}
