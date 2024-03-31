//
//  Resources.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 31.03.2024.
//

import UIKit

enum Resources {
    
    enum Image {
        case mainImage
        case detectorImage
        case filterButton
        
        var image: UIImage? {
            switch self {
            case .mainImage:
                return UIImage(named: "mainImage")
                
            case .detectorImage:
                return UIImage(named: "detectorImage")
                
            case .filterButton:
                return UIImage(named: "filterButton")
            }
        }
    }
    
    enum Font {
        
    }
}

