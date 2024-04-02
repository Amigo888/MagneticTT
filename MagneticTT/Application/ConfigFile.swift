//
//  ConfigFile.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit
import DeviceKit

final class ConfigFile {
    static let shared = ConfigFile()
    
    let currentDevice = Device.current
    let smallIphone: [Device] = [.iPhoneSE, .iPhoneSE2, .iPhoneSE3, .iPhone6,
                                 .iPhone6s, .iPhone7, .iPhone8,
                                 .simulator(.iPhoneSE), .simulator(.iPhoneSE2),
                                 .simulator(.iPhoneSE3), .simulator(.iPhone7),
                                 .simulator(.iPhone8), .simulator(.iPhone6), .simulator(.iPhone6s)
    ]
    let currentDeviceDiagonal = Device.current.diagonal
}
