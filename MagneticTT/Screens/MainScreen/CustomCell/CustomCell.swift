//
//  CustomCell.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 31.03.2024.
//

import UIKit

final class CustomCell: UICollectionViewCell {
    
    
    
    
    var editAction: (() -> Void)?
    var deleteAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
