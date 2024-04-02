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
        customFlowLayout.minimumLineSpacing = 35
        return customFlowLayout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: customFlowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: String(describing: CustomCell.self))
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        return collectionView
    }()
    
    private let collectionViewCases = MainCategories.allCases
    
    private var customMainViewTopOffset: CGFloat {
        return UIScreen.main.bounds.height / 21.1
    }
    
    private var collecintionViewHorizontalOffset: CGFloat {
        return UIScreen.main.bounds.width / 10.8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()
        setupConstraints()
        setupViewAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        setupNavBar()
        setupHeader()
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
    
    private func setupNavBar() {
        navigationItem.title = "Main"
        navigationItem.titleView = UIView()
        navigationItem.backButtonDisplayMode = .default
    }
    
    private func setupConstraints() {
        mainImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(mainImage.snp.width).dividedBy(1.185)
        }
        
        customMainView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(customMainView.snp.width).dividedBy(1.76)
            make.top.equalTo(mainImage.snp.bottom).inset(customMainViewTopOffset)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(customMainView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(collecintionViewHorizontalOffset)
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

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let contentInsets = collectionView.contentInset
        let totalContentWidth = collectionView.bounds.width - (contentInsets.left + contentInsets.right)
        let numberOfColumns: CGFloat = 2
        let spacingBetweenCells: CGFloat = 38
        let totalSpacing = spacingBetweenCells * (numberOfColumns - 1)
        let widthForItem = (totalContentWidth - totalSpacing) / numberOfColumns
        
        let heightForItem = widthForItem
        
        return CGSize(width: widthForItem, height: heightForItem)
    }
}
