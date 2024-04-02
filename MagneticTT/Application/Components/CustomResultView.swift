//
//  CustomResultView.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

final class CustomResultView: UIView {
    
    private lazy var quantityOfDevice: UILabel = {
        let label = UILabel(
            text: "5",
            textColor: .customPurpleLight,
            font: Resources.Font.robotoBold(28)
        )
        let shadow = NSShadow.shadowCreate()
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        attributedString.addAttribute(
            NSAttributedString.Key.shadow,
            value: shadow,
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var deviceFoundLabel = UILabel(
        text: "Devices",
        textColor: .white,
        font: Resources.Font.robotoBold(28)
    )
    private lazy var wifiName = UILabel(
        text: "WIFI_Name",
        textColor: .customDarkGrey,
        font: Resources.Font.robotoRegular(15)
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupUI() {
        backgroundColor = .clear
        addSubview(quantityOfDevice)
        addSubview(deviceFoundLabel)
        addSubview(wifiName)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        deviceFoundLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(10)
            make.top.equalToSuperview()
        }
        
        quantityOfDevice.snp.makeConstraints { make in
            make.centerY.equalTo(deviceFoundLabel)
            make.trailing.equalTo(deviceFoundLabel.snp.leading).offset(-8)
        }
        
        wifiName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(deviceFoundLabel.snp.bottom).offset(8)
        }
    }
}
