//
//  CustomDetailedView.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

final class CustomDetailedView: UIView {
    
    // MARK: - Private Properties
    
    private lazy var typeOfDevice: UILabel = {
        let label = UILabel(
            text: Text.typeOfDevice,
            textColor: .customPurpleLight,
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
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.register(DeviceInfoCell.self)
        return tableView
    }()
    
    // MARK: - Property
    
    var detailedInfo: Devices?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - LayoutSubviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        typeOfDevice.addShadowToText(shadow: NSShadow.shadowCreate())
    }
    
    // MARK: - Private Methods
    
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
            make.top.equalToSuperview().offset(Constraints.Fixed.baseOffset24)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(stackView.snp.bottom).offset(Constraints.Fixed.baseOffset24)
        }
    }
    
    // MARK: - Methods
    
    func setupViewWithData() {
        guard let info = detailedInfo else {
            return
        }
        typeOfDevice.textColor = info.isConnected ? .customPurpleLight : .customRedColor
        typeOfDevice.text = info.routerName
        ipAddress.text = info.ipAddress
    }
}

// MARK: - Extension UITableViewDataSource

extension CustomDetailedView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Value.detailedTableViewCellQuantity
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(DeviceInfoCell.self)
        guard let info = detailedInfo else {
            return UITableViewCell()
        }
        cell.configure(with: info, indexPath: indexPath.row)
        return cell
    }
}

// MARK: - Extension UITableViewDelegate

extension CustomDetailedView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Value.detailedTableViewRowHeight
    }
}
