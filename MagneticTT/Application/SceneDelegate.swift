//
//  SceneDelegate.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 31.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        let mainVC = NetworkScanViewController()
        let navigationController = UINavigationController(rootViewController:mainVC)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        window?.isMultipleTouchEnabled = false
        UIView.appearance().isExclusiveTouch = true
    }
}

