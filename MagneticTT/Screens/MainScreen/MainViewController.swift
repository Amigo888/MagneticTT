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
        customFlowLayout.minimumLineSpacing = Constraints.Fixed.minimumLineSpacing
        customFlowLayout.minimumInteritemSpacing = Constraints.Fixed.minimumInteritemSpacing
        return customFlowLayout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: customFlowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        if currentDiagonal >= Value.deviceDiagonal {
            collectionView.isScrollEnabled = false
        } else {
            collectionView.isScrollEnabled = true
        }
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: String(describing: CustomCell.self))
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(
            top: .zero,
            left: Constraints.Fixed.baseOffset18,
            bottom: Constraints.Fixed.baseOffset8,
            right: Constraints.Fixed.baseOffset18
        )
        return collectionView
    }()
    
    private let collectionViewCases = MainCategories.allCases
    private let currentDiagonal = ConfigFile.shared.currentDeviceDiagonal

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
            make.height.equalTo(mainImage.snp.width).dividedBy(Constraints.Fixed.dividerForMainImage)
        }
        
        customMainView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constraints.Fixed.baseOffset20)
            make.height.equalTo(customMainView.snp.width).dividedBy(Constraints.Fixed.customMainViewDividerHeight)
            make.top.equalTo(mainImage.snp.bottom).inset(Constraints.Calculated.customMainViewTopOffset)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(customMainView.snp.bottom).offset(Constraints.Fixed.baseOffset16)
            make.leading.trailing.equalToSuperview().inset(Constraints.Fixed.baseOffset18)
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
    
    @objc private func settingButtonTapped() {}
    
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewContentInset: CGFloat = Constraints.Fixed.baseOffset18
        let distanceBetweenItems: CGFloat = Constraints.Fixed.minimumInteritemSpacing
        let cellWidth = (collectionView.frame.width - distanceBetweenItems - collectionViewContentInset * 2) / 2
        let cellHeight = cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
