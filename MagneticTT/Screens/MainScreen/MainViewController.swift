//
//  ViewController.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 31.03.2024.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resources.Image.mainImage.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var currentWiFiLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Current Wi-Fi"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var wiFiNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "WIFI_Name"
        label.font = .systemFont(ofSize: 28)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var readyScanLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Ready to Scan this network"
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var scanButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Scan current network", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 25
        button.titleLabel?.textColor = .white
        return button
    }()
    
    private lazy var stackViewBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .infoWiFiBackground
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            currentWiFiLabel,
            wiFiNameLabel,
            readyScanLabel,
            scanButton
        ])
        stackView.setCustomSpacing(0, after: currentWiFiLabel)
        stackView.setCustomSpacing(16, after: wiFiNameLabel)
        stackView.setCustomSpacing(8, after: readyScanLabel)
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var customFlowLayout: UICollectionViewFlowLayout = {
        let customFlowLayout = UICollectionViewFlowLayout()
        customFlowLayout.itemSize = CGSize(width: 140, height: 140)
        customFlowLayout.minimumInteritemSpacing = 38
        customFlowLayout.minimumLineSpacing = 35
        return customFlowLayout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: customFlowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: String(describing: CustomCell.self))
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHeader()
        addViews()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .backgroundColor
    }
    
    private func setupHeader() {
        let filterImage = Resources.Image.filterButton.image?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let filterButton = UIBarButtonItem(image: filterImage, style: .done, target: self, action: #selector(settingButtonTapped))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    private func addViews() {
        view.addSubview(mainImage)
        view.addSubview(stackViewBackground)
        stackViewBackground.addSubview(stackView)
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        mainImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(329)
        }
        
        stackViewBackground.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(198)
            make.top.equalTo(mainImage.snp.bottom).inset(40)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(24)
        }
        
        scanButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(stackViewBackground.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(36)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func settingButtonTapped() {
        print("hi")
    }
}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: CustomCell.self),
            for: indexPath
        ) as? CustomCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .red
        return cell
    }
}
