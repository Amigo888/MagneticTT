//
//  MagneticViewController.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 01.04.2024.
//

import UIKit

final class MagneticViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var detectorImage = createImageView(with: Resources.Image.detectorImage.image)
    private lazy var circleGradient = createImageView(with: Resources.Image.circleGradient.image)
    private lazy var seacrhNiddle = createImageView(with: Resources.Image.niddle.image)
    
    private lazy var searchButton: ReusableButton = {
        let button = ReusableButton(title: Text.magneticButtonSearch)
        button.addTarget(self, action: #selector(startSearch), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchCheckingLabel: UILabel = {
        let label = UILabel(
            text: Text.searchCheckingLabelText,
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
    
    private let currentDevice = ConfigFile.shared.currentDevice
    private let devices = ConfigFile.shared.smallIphone
    private var isSearchingStarted: Bool = false
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()
        setupConstaints()
        setupCornerButtonRadius()
    }
    
    // MARK: - ViewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        view.backgroundColor = .backgroundColor
        title = Text.magneticViewTilte
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
            make.height.equalTo(detectorImage.snp.width).dividedBy(Constraints.Fixed.dividerForMainImage)
        }
        
        circleGradient.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constraints.Fixed.baseOffset20)
            make.height.equalTo(circleGradient.snp.width).dividedBy(Constraints.Fixed.circleGradientDividerHeight)
            if currentDevice.isOneOf(devices) {
                make.top.equalTo(detectorImage.snp.bottom).offset(Constraints.Calculated.circleGradientTopOffsetSE)
            } else {
                make.top.equalTo(detectorImage.snp.bottom).offset(Constraints.Calculated.circleGradientTopOffset)
            }
        }
        
        searchButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constraints.Fixed.baseOffset20)
            make.height.equalTo(Constraints.Calculated.generalButtonHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(Constraints.Calculated.generalButtonOffset)
        }
        
        searchCheckingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(circleGradient.snp.bottom).offset(Constraints.Calculated.searchCheckingLabelTopOffset)
        }
        
        circle.snp.makeConstraints { make in
            make.size.equalTo(Constraints.Fixed.circleSize)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        seacrhNiddle.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.center.equalTo(circle)
        }
        seacrhNiddle.layer.anchorPoint = CGPoint(x: Value.baseOne, y: Value.baseHalfOne)
        circle.layer.anchorPoint = CGPoint(x: Value.baseHalfOne, y: Value.baseHalfOne)
    }
    
    private func setupCornerButtonRadius() {
        searchButton.layer.cornerRadius = Constraints.Calculated.generalButtonHeight / Value.baseTwo
    }
    
    private func animateArrow() {
        let randomAngle = Double.random(in: 40...90)
        let radians = CGFloat(randomAngle * .pi / Value.halfOfCircleDegree)
        
        UIView.animate(withDuration: Value.baseHalfOne, delay: .zero, options: [.curveLinear], animations: {
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
            searchButton.setTitle(Text.magneticButtonSearch, for: .normal)
            circle.backgroundColor = .customNiddleColor
            searchCheckingLabel.text = Text.searchCheckingLabelText
            seacrhNiddle.image = Resources.Image.niddle.image
            UIView.animate(withDuration: Value.baseZeroThree, delay: .zero, animations: {
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
        searchButton.setTitle(Text.generalButtonStop, for: .normal)
        animateArrow()
    }
}
