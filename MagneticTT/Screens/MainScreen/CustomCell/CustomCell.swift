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
    
    private lazy var categoryName = UILabel(
        textColor: .white,
        font: Resources.Font.robotoMedium(17),
        numberOfLines: 2
    )
    
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
                make.leading.trailing.equalToSuperview().inset(Constraints.Calculated.mainScreenCellHorizontalOffset)
                make.top.bottom.equalToSuperview().inset(Constraints.Calculated.mainScreenCellVerticalOffset)
            } else {
                make.leading.trailing.equalToSuperview()
                make.top.bottom.equalToSuperview().inset(Constraints.Fixed.baseOffset20)
            }
        }
        
        categoryImage.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(Constraints.Fixed.categoryImageDividerHeight)
            make.width.equalTo(categoryImage.snp.height).dividedBy(Constraints.Fixed.categoryImageDividerWidth)
        }
    }
    
    func configureCell(category: MainCategories) {
        categoryName.text = category.title
        categoryImage.image = category.image
    }
}
