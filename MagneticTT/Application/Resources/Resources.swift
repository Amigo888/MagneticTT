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
        case deviceConnected
        case deviceNoConnected
        
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
                
            case .deviceConnected:
                return UIImage(named: "deviceConnected")
                
            case .deviceNoConnected:
                return UIImage(named: "deviceNoConnected")
                
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
