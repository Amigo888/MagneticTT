//
//  NetworkScanViewController.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 01.04.2024.
//

import UIKit
import Lottie

final class NetworkScanViewController: UIViewController {
    
    private lazy var animationView: LottieAnimationView = {
        let animation = LottieAnimationView(name: "hc6 s")
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .loop
        animation.animationSpeed = 1
        return animation
    }()
    
    private lazy var scanWiFiLabel = UILabel(
        text: "Scanning Your Wi-Fi",
        textColor: .white,
        font: Resources.Font.robotoRegular(15)
    )
    
    private lazy var wiFiNameLabel: UILabel = {
        let label = UILabel(
            text: "TLind_246_lp",
            textColor: .customPurpleLight,
            font: Resources.Font.robotoBold(28)
        )
        label.addShadowToText(shadow: NSShadow.shadowCreate())
        return label
    }()
    
    private lazy var percantIndicator = UILabel(
        text: "20%",
        textColor: .white,
        font: Resources.Font.robotoMedium(17)
    )
    
    private lazy var quantityOfDevice: UILabel = {
        let label = UILabel(
            text: "25",
            textColor: .customPurpleLight,
            font: Resources.Font.robotoBold(28)
        )
        label.addShadowToText(shadow: NSShadow.shadowCreate())
        return label
    }()
    
    private lazy var deviceFoundLabel = UILabel(
        text: "Devices Found...",
        textColor: .white,
        font: Resources.Font.robotoMedium(17)
    )
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            scanWiFiLabel,
            wiFiNameLabel
        ])
        stackView.spacing = 0
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var stopButton: ReusableButton = {
        let button = ReusableButton(title: "Stop")
        button.addTarget(self, action: #selector(stopScan), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupLottieTransaction()
    }
    
    private func setupView() {
        view.backgroundColor = .backgroundColor
    }
    
    private func addViews() {
        view.addSubview(animationView)
        animationView.addSubview(percantIndicator)
        view.addSubview(stackView)
        view.addSubview(quantityOfDevice)
        view.addSubview(deviceFoundLabel)
        view.addSubview(stopButton)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(65)
        }
        
        animationView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(71)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(animationView.snp.width)
        }
        
        percantIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        quantityOfDevice.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(32)
            make.centerX.equalToSuperview().offset(-60)
        }
        
        deviceFoundLabel.snp.makeConstraints { make in
            make.leading.equalTo(quantityOfDevice.snp.trailing).offset(8)
            make.centerY.equalTo(quantityOfDevice)
        }
        
        stopButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(36)
        }
    }
    
    private func setupLottieTransaction() {
        animationView.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.navigationController?.pushViewController(ResultViewController(), animated: true)
        }
    }
    
    @objc private func stopScan() {
        navigationController?.popToRootViewController(animated: true)
    }
}
