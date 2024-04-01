//
//  MagneticViewController.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 01.04.2024.
//

import UIKit

final class MagneticViewController: UIViewController {
    
    private lazy var detectorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resources.Image.detectorImage.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var circleGradient: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resources.Image.circleGradient.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .customPurpleLight
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = Resources.Font.robotoBold(20)
        button.layer.cornerRadius = 25
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(startSearch), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchCheckingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Search checking"
        label.font = Resources.Font.robotoMedium(17)
        label.textAlignment = .center
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.customPurpleLight?.withAlphaComponent(0.55)
        shadow.shadowBlurRadius = 5
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: -0.41,
            range: NSRange(location: 0, length: attributedString.length)
        )
        attributedString.addAttribute(
            NSAttributedString.Key.shadow,
            value: shadow,
            range: NSRange(location: 0, length: attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var circle: UIView = {
        let view = UIView()
        view.backgroundColor = .customNiddleColor
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var seacrhNiddle: UIImageView = {
        let imageView = UIImageView(image: Resources.Image.niddle.image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var isSearchingStarted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
        addViews()
        setupConstaints()
    }
    
    private func setupView() {
        view.backgroundColor = .backgroundColor
        title = "Magnetic Detection"
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: -0.41
        ]
        
        let backButton = UIBarButtonItem()
        backButton.title = "Main"
        backButton.tintColor = .customPurpleLight
        let attributes: [NSAttributedString.Key: Any] = [
            .font: Resources.Font.robotoRegular(17),
            .kern: -0.41
        ]
        backButton.setTitleTextAttributes(attributes, for: .normal)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
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
            make.top.equalTo(detectorImage.snp.bottom).offset(62)
        }
        
        searchButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(36)
        }
        
        searchCheckingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(circleGradient.snp.bottom).offset(47)
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
    
    private func animateArrow() {
        let randomAngle = Double.random(in: 40...90)
        let radians = CGFloat(randomAngle * .pi / 180.0) // Переводим угол в радианы
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear], animations: {
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

    @objc private func startSearch() {
        if isSearchingStarted {
            self.searchButton.isEnabled = false
            isSearchingStarted = false
            searchButton.setTitle("Search", for: .normal)
            circle.backgroundColor = .customNiddleColor
            searchCheckingLabel.text = "Search checking"
            seacrhNiddle.image = Resources.Image.niddle.image
            UIView.animate(withDuration: 0.3, delay: 0.0, animations: {
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
