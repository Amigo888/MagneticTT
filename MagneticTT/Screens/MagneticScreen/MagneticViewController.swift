//
//  MagneticViewController.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 01.04.2024.
//

import UIKit

final class MagneticViewController: UIViewController {
    
    private lazy var detectorImage = createImageView(with: Resources.Image.detectorImage.image)
    private lazy var circleGradient = createImageView(with: Resources.Image.circleGradient.image)
    private lazy var seacrhNiddle = createImageView(with: Resources.Image.niddle.image)
    private lazy var searchButton: ReusableButton = {
        let button = ReusableButton(title: "Start")
        button.addTarget(self, action: #selector(startSearch), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchCheckingLabel: UILabel = {
        let label = UILabel(
            text: "Search checking",
            textColor: .white,
            font: Resources.Font.robotoMedium(17)
        )
        label.addShadowToText(shadow: NSShadow.shadowCreate())
        return label
    }()
    
    private lazy var circle: UIView = {
        let view = UIView()
        view.backgroundColor = .customNiddleColor
        view.layer.cornerRadius = 16
        return view
    }()
    
    private var isSearchingStarted: Bool = false
    
    private var searcButtonHeight: CGFloat {
        return UIScreen.main.bounds.height / 16.88
    }
    
    private var searcButtonBottomOffset: CGFloat {
        return UIScreen.main.bounds.height / 23.44
    }
    
    private var circleGradientTopOffset: CGFloat {
        return UIScreen.main.bounds.height / 13.61
    }
    
    private var searchCheckingLabelTopOffset: CGFloat {
        return UIScreen.main.bounds.height / 17.95
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()
        setupConstaints()
        setupCornerButtonRadius()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setupView() {
        view.backgroundColor = .backgroundColor
        title = "Magnetic Detection"
    }
    
    private func addViews() {
        view.addSubview(detectorImage)
        view.addSubview(circleGradient)
        view.addSubview(searchButton)
        view.addSubview(searchCheckingLabel)
        circleGradient.addSubview(circle)
        circleGradient.addSubview(seacrhNiddle)
    }
    
    private func setupConstaints() {
        detectorImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(detectorImage.snp.width).dividedBy(1.185)
        }
        
        circleGradient.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(circleGradient.snp.width).dividedBy(1.944)
            make.top.equalTo(detectorImage.snp.bottom).offset(circleGradientTopOffset)
        }
        
        searchButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(searcButtonHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(searcButtonBottomOffset)
        }
        
        searchCheckingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(circleGradient.snp.bottom).offset(searchCheckingLabelTopOffset)
        }
        
        circle.snp.makeConstraints { make in
            make.size.equalTo(32)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        seacrhNiddle.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.center.equalTo(circle)
        }
        seacrhNiddle.layer.anchorPoint = CGPoint(x: 1.0, y: 0.5)
        circle.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    private func setupCornerButtonRadius() {
        searchButton.layer.cornerRadius = searcButtonHeight / 2
    }
    
    private func animateArrow() {
        let randomAngle = Double.random(in: 40...90)
        let radians = CGFloat(randomAngle * .pi / 180.0)
        
        UIView.animate(withDuration: 0.5, delay: .zero, options: [.curveLinear], animations: {
            self.seacrhNiddle.transform = CGAffineTransform(rotationAngle: radians)
        }, completion: { [weak self] _ in
            guard let self else { return }
            self.searchButton.isEnabled = true
            if self.isSearchingStarted {
                self.searchCheckingLabel.text = String(format: "%.1fµT", randomAngle)
                self.animateArrow()
            }
        })
    }
    
    private func createImageView(with image: UIImage?) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    @objc private func startSearch() {
        if isSearchingStarted {
            self.searchButton.isEnabled = false
            isSearchingStarted = false
            searchButton.setTitle("Search", for: .normal)
            circle.backgroundColor = .customNiddleColor
            searchCheckingLabel.text = "Search checking"
            seacrhNiddle.image = Resources.Image.niddle.image
            UIView.animate(withDuration: 0.3, delay: .zero, animations: {
                self.seacrhNiddle.transform = .identity
            }, completion: { [weak self] _ in
                guard let self else { return }
                self.searchButton.isEnabled = true
            })
            return
        }
        searchButton.isEnabled = false
        isSearchingStarted = true
        circle.backgroundColor = .white
        seacrhNiddle.image = Resources.Image.niddle.image?.withTintColor(.white, renderingMode: .alwaysOriginal)
        searchButton.setTitle("Stop", for: .normal)
        animateArrow()
    }
}
