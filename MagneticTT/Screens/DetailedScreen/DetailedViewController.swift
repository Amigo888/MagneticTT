//
//  DetailedViewController.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

final class DetailedViewController: UIViewController {
    
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var detailedView = CustomDetailedView()
    var deviceInfo: Devices?
    
    private var detailedViewSideOffset: CGFloat {
        return UIScreen.main.bounds.width / 19.5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()
        setupConstraints()
        setupViewWithData()
        setupDetailedViewWithData()
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupView() {
        view.backgroundColor = .backgroundColor
        title = "Device Details"
    }
    
    private func addViews() {
        view.addSubview(mainImage)
        view.addSubview(detailedView)
    }
    
    private func setupConstraints() {
        mainImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(mainImage.snp.width).dividedBy(1.185)
        }
        
        detailedView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(detailedViewSideOffset)
            make.height.equalTo(294)
            make.top.equalTo(mainImage.snp.bottom).inset(40)
        }
    }
    
    private func setupNavBar() {
        navigationItem.backButtonDisplayMode = .minimal
    }
    
    private func setupViewWithData() {
        guard let deviceInfo = deviceInfo else {
            return
        }
        deviceInfo.isConnected ?
        (mainImage.image = Resources.Image.deviceConnected.image) :
        (mainImage.image = Resources.Image.deviceNoConnected.image)
        
        detailedView.detailedInfo = deviceInfo
    }
    
    private func setupDetailedViewWithData() {
        detailedView.setupViewWithData()
    }
}

