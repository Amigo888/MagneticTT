//
//  TableViewCustomCell.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

final class TableViewCustomCell: UITableViewCell {
    
    private lazy var wifiImage: UIImageView = {
        let imageView = UIImageView(image: Resources.Image.connectedWiFi.image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var routerName = UILabel(
        textColor: .white,
        font: Resources.Font.robotoRegular(17)
    )
    
    private lazy var ipAddress = UILabel(
        textColor: .customDarkGrey,
        font: Resources.Font.robotoRegular(13)
    )
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            routerName,
            ipAddress
        ])
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView(image: Resources.Image.chevronLeft.image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        backgroundColor = .infoWiFiBackground
    }
    
    private func addViews() {
        contentView.addSubview(wifiImage)
        contentView.addSubview(stackView)
        contentView.addSubview(arrowImage)
    }
    
    private func setupConstraints() {
        wifiImage.snp.makeConstraints { make in
            make.size.equalTo(36)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(wifiImage.snp.trailing).offset(16)
        }
        
        arrowImage.snp.makeConstraints { make in
            make.width.equalTo(9)
            make.height.equalTo(16)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    func configure(device: Devices) {
        routerName.text = device.routerName
        ipAddress.text = device.routerName
        device.isConnected ?
        (wifiImage.image = Resources.Image.connectedWiFi.image) :
        (wifiImage.image = Resources.Image.notConnectedWiFi.image)
    }
}
