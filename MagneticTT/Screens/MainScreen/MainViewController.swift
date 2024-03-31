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
        return imageView
    }()
    
    //    private lazy var
    
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
        let filterImage = Resources.Image.filterButton.image?.withRenderingMode(.alwaysTemplate)
        filterImage?.withTintColor(.red)
        filterImage?.withTintColor(.white)
        let filterButton = UIBarButtonItem(image: filterImage, style: .done, target: self, action: #selector(settingButtonTapped))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    private func addViews() {
        view.addSubview(mainImage)
    }
    
    private func setupConstraints() {
        mainImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(329)
        }
    }
    
    @objc private func settingButtonTapped() {
        
    }
}

//#Preview {
//    let mainVC = MainViewController()
//    return mainVC
//}
