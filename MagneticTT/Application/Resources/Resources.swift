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
        case bluetooth
        case tips
        case homeCamera
        case magnetic
        
        var image: UIImage? {
            switch self {
            case .mainImage:
                return UIImage(named: "mainImage")
                
            case .detectorImage:
                return UIImage(named: "detectorImage")
                
            case .filterButton:
                return UIImage(named: "filterButton")
                
            case .bluetooth:
                return UIImage(named: "bluetooth")
                
            case .tips:
                return UIImage(named: "tips")
                
            case .homeCamera:
                return UIImage(named: "homeCamera")
                
            case .magnetic:
                return UIImage(named: "magnetic")
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

