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
        case circleGradient
        case niddle
        case connectedWiFi
        case notConnectedWiFi
        case chevronLeft
        
        var image: UIImage? {
            switch self {
            case .mainImage:
                return UIImage(named: "mainImage")
                
            case .detectorImage:
                return UIImage(named: "detectorImage")
                
            case .filterButton:
                return UIImage(named: "filterButton")
            
            case .circleGradient:
                return UIImage(named: "circleGradient")
                
            case .niddle:
                return UIImage(named: "niddle")
            
            case .connectedWiFi:
                return UIImage(named: "connectedWiFi")
            
            case .notConnectedWiFi:
                return UIImage(named: "notConnectedWiFi")
            
            case .chevronLeft:
                return UIImage(named: "chevronLeft")
                
            }
        }
    }
    
    enum Font {
        static func robotoMedium(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Medium", size: size)!
        }
        
        static func robotoLight(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Light", size: size)!
        }
        
        static func robotoRegular(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Regular", size: size)!
        }
        
        static func robotoMediumItalic(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-MediumItalic", size: size)!
        }
        
        static func robotoThinItalic(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-ThinItalic", size: size)!
        }
        
        static func robotoBoldItalic(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-BoldItalic", size: size)!
        }
        
        static func robotoLightItalic(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-LightItalic", size: size)!
        }
        
        static func robotoItalic(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Italic", size: size)!
        }
        
        static func robotoBlackItalic(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-BlackItalic", size: size)!
        }
        
        static func robotoBold(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Bold", size: size)!
        }
        
        static func robotoThin(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Thin", size: size)!
        }
        
        static func robotoBlack(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Roboto-Black", size: size)!
        }
    }
}

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
            "Infrared Detection"
        case .bluetooth:
            "Bluetooth Detection"
        case .magnetic:
            "Magnetic Detection"
        case .tips:
            "Antispy Tips"
        }
    }
}
