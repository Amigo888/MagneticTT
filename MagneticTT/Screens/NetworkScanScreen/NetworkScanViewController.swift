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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()
        setupConstraints()
        animationView.play()
    }
    
    private func setupView() {
        view.backgroundColor = .backgroundColor
    }
    
    private func addViews() {
        view.addSubview(animationView)
    }
    
    private func setupConstraints() {
        animationView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(animationView.snp.width)
        }
    }
}
