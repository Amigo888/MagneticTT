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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
//        setupConstraints()
//        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.backgroundColor = .cellBackgroundColor
        layer.masksToBounds = false
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.cellBackgroundColor?.withAlphaComponent(0.45).cgColor
        layer.shadowOffset = CGSize(width: -8, height: -8)
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
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(20)
        }
        
        categoryImage.snp.makeConstraints { make in
            make.width.equalTo(31)
            make.height.equalTo(44)
        }
    }
    
    func configureCell() {
        categoryName.text = "Infrared Detection"
        categoryImage.image = Resources.Image.homeCamera.image
    }
}
