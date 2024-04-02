//
//  CustomCell.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 31.03.2024.
//

import UIKit

final class CustomCell: UICollectionViewCell {
    
    private lazy var categoryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var categoryName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = Resources.Font.robotoMedium(17)
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: -0.41, range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString

        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            categoryImage,
            categoryName
        ])
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private var stackViewHorizontalOffset: CGFloat {
        return UIScreen.main.bounds.width / 21
    }
    
    private var stackViewVerticalOffset: CGFloat {
        return UIScreen.main.bounds.height / 60
    }
    
    private let currentDevice = ConfigFile.shared.currentDevice
    private let devices = ConfigFile.shared.smallIphone
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.backgroundColor = .cellBackgroundColor
        layer.masksToBounds = false
        contentView.layer.cornerRadius = 8
        layer.shadowColor = UIColor.cellBackgroundColor?.withAlphaComponent(0.45).cgColor
//        layer.shadowColor = UIColor.red.cgColor
        layer.shadowOffset = CGSize(width: -8, height: 8)
        layer.shadowRadius = 24
        layer.shadowOpacity = 1.0
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 8).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func addViews() {
        contentView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            if currentDevice.isOneOf(devices) {
                make.leading.trailing.equalToSuperview().inset(stackViewHorizontalOffset)
                make.top.bottom.equalToSuperview().inset(stackViewVerticalOffset)
            } else {
                make.leading.trailing.equalToSuperview()
                make.top.bottom.equalToSuperview().inset(20)
            }
        }
        
        categoryImage.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(3.18)
            make.width.equalTo(categoryImage.snp.height).dividedBy(1.32)
        }
    }
    
    func configureCell(category: MainCategories) {
        categoryName.text = category.title
        categoryImage.image = category.image
    }
}
