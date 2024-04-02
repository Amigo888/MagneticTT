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
        let imageView = UIImageView(image: Resources.Image.mainImage.image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var customMainView = CustomMainView()
    
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
    
    private let collectionViewCases = MainCategories.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHeader()
        addViews()
        setupConstraints()
        setupViewAction()
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
        view.addSubview(customMainView)
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        mainImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(mainImage.snp.width).dividedBy(1.185)
        }
        
        customMainView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(198)
            make.top.equalTo(mainImage.snp.bottom).inset(40)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(customMainView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(36)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupViewAction() {
        customMainView.action = { [weak self] in
            guard let self else {
                return
            }
            self.scanNetwork()
        }
    }
    
    @objc private func settingButtonTapped() {
        print("TEST")
    }
    
    @objc private func scanNetwork() {
        let networkScanVC = NetworkScanViewController()
        navigationController?.pushViewController(networkScanVC, animated: true)
    }
}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: CustomCell.self),
            for: indexPath
        ) as? CustomCell else {
            return UICollectionViewCell()
        }
        let type = collectionViewCases[indexPath.row]
        cell.configureCell(category: type)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionViewCases[indexPath.row] {
        case .bluetooth:
            print("Bluetooth")
        case .homeCamera:
            print("HomeCamera")
        case .magnetic:
            print("magnetic")
            let magneticVC = MagneticViewController()
            navigationController?.pushViewController(magneticVC, animated: true)
        case .tips:
            print("Tips")
        }
    }
}
