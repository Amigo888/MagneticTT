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
        label.addShadowToText(shadow: NSShadow.shadowCreate())
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
            make.centerX.equalToSuperview().offset(Constraints.Fixed.baseOffset10)
            make.top.equalToSuperview()
        }
        
        quantityOfDevice.snp.makeConstraints { make in
            make.centerY.equalTo(deviceFoundLabel)
            make.trailing.equalTo(deviceFoundLabel.snp.leading).offset(-Constraints.Fixed.baseOffset8)
        }
        
        wifiName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(deviceFoundLabel.snp.bottom).offset(Constraints.Fixed.baseOffset8)
        }
    }
}
