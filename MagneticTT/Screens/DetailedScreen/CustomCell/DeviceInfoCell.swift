//
//  DeviceInfoCell.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//


import UIKit

final class DeviceInfoCell: UITableViewCell {
    
    private lazy var categoryLabel = UILabel(
        textColor: .white,
        font: Resources.Font.robotoRegular(17)
    )
    
    private lazy var infoLabel = UILabel(
        textColor: .customDarkGrey,
        font: Resources.Font.robotoRegular(17)
    )
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            categoryLabel,
            infoLabel
        ])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
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
        selectionStyle = .none
    }
    
    private func addViews() {
        contentView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(Constraints.Fixed.baseOffset16)
        }
    }
    
    func configure(with info: Devices, indexPath: Int) {
        switch indexPath {
        case 0:
            categoryLabel.text = "Connection Type"
            infoLabel.text = info.typeConnection.rawValue
        case 1:
            categoryLabel.text = "IP Address"
            infoLabel.text = info.ipAddress
        case 2:
            categoryLabel.text = "MAC Address"
            infoLabel.text = info.macAddress
        case 3:
            categoryLabel.text = "Hostname"
            infoLabel.text = info.hostName
        default:
            break
        }
    }
}
