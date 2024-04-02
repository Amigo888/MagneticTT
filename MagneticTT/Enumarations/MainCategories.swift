//
//  MainCategories.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

enum MainCategories: Int, CaseIterable {
    case homeCamera
    case bluetooth
    case magnetic
    case tips
    
    var image: UIImage? {
        switch self {
        case .homeCamera:
            return UIImage(named: "homeCamera")
            
        case .bluetooth:
            return UIImage(named: "bluetooth")
            
        case .magnetic:
            return UIImage(named: "magnetic")
            
        case .tips:
            return UIImage(named: "tips")
        }
    }
    
    var title: String {
        switch self {
        case .homeCamera:
            "Infrared \nDetection"
        case .bluetooth:
            "Bluetooth \nDetection"
        case .magnetic:
            "Magnetic \nDetection"
        case .tips:
            "Antispy \nTips"
        }
    }
}
