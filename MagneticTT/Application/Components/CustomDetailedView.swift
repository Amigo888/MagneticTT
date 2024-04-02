//
//  CustomDetailedView.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

final class CustomDetailedView: UIView {
    
    private lazy var typeOfDevice: UILabel = {
        let label = UILabel(
            font: Resources.Font.robotoBold(28)
        )
        label.addShadowToText(shadow: NSShadow.shadowCreate())
        return label
    }()
    
    private lazy var ipAddress = UILabel(
        textColor: .white,
        font: Resources.Font.robotoRegular(15)
    )
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            typeOfDevice,
            ipAddress
        ])
        stackView.spacing = 0
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.register(DeviceInfoCell.self, forCellReuseIdentifier: String(describing: DeviceInfoCell.self))
        return tableView
    }()
    
    var detailedInfo: Devices?
    
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
        backgroundColor = .infoWiFiBackground
        layer.cornerRadius = 8
    }
    
    private func addViews() {
        addSubview(tableView)
        addSubview(stackView)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(stackView.snp.bottom).offset(24)
        }
    }
    
    func setupViewWithData() {
        guard let info = detailedInfo else {
            return
        }
        typeOfDevice.textColor = info.isConnected ? .customPurpleLight : .red
        typeOfDevice.text = info.routerName
        ipAddress.text = info.ipAddress
    }
}

extension CustomDetailedView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: DeviceInfoCell.self),
            for: indexPath
        ) as? DeviceInfoCell else {
            return UITableViewCell()
        }
        guard let info = detailedInfo else {
            return UITableViewCell()
        }
        cell.configure(with: info)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}
