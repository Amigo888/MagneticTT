//
//  CustomResultView.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

final class CustomResultView: UIView {
    
    // MARK: - Private Properties
    
    private lazy var quantityOfDevice: UILabel = {
        let label = UILabel(
            text: Text.quantityOfResultDevice,
            textColor: .customPurpleLight,
            font: Resources.Font.robotoBold(28)
        )
        label.addShadowToText(shadow: NSShadow.shadowCreate())
        return label
    }()
    
    private lazy var deviceFoundLabel = UILabel(
        text: Text.deviceFoundResultLabel,
        textColor: .white,
        font: Resources.Font.robotoBold(28)
    )
    private lazy var wifiName = UILabel(
        text: Text.wiFiNameMainLabel,
        textColor: .customDarkGrey,
        font: Resources.Font.robotoRegular(15)
    )
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private Methods
    
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
