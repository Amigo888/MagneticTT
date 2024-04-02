//
//  ResultViewModel.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import Foundation

// MARK: - TypeConnection

enum TypeConnection: String {
    case WiFi
    case WLAN
}

// MARK: - Devices

struct Devices {
    let routerName: String
    let ipAddress: String
    let isConnected: Bool
    let macAddress: String
    let hostName: String
    let typeConnection: TypeConnection
}

final class ResultViewModel {
    
    var onItemsUpdated: (() -> Void)?
    var devices: [Devices] = [] {
        didSet {
            onItemsUpdated?()
        }
    }
    
    // MARK: - Method
    
    func fetchData() {
        let devicesArray = [
            Devices(routerName: "Router 1", ipAddress: "192.168.1.2", isConnected: true, macAddress: "00:11:22:33:44:55", hostName: "Device 1", typeConnection: .WiFi),
            Devices(routerName: "Router 2", ipAddress: "192.168.1.3", isConnected: false, macAddress: "AA:BB:CC:DD:EE:FF", hostName: "Device 2", typeConnection: .WLAN),
            Devices(routerName: "Router 3", ipAddress: "192.168.1.4", isConnected: true, macAddress: "11:22:33:44:55:66", hostName: "Device 3", typeConnection: .WLAN),
            Devices(routerName: "Router 4", ipAddress: "192.168.1.5", isConnected: true, macAddress: "22:33:44:55:66:77", hostName: "Device 4", typeConnection: .WLAN),
            Devices(routerName: "Router 5", ipAddress: "192.168.1.6", isConnected: false, macAddress: "33:44:55:66:77:88", hostName: "Device 5", typeConnection: .WLAN),
            Devices(routerName: "Router 6", ipAddress: "192.168.1.7", isConnected: true, macAddress: "44:55:66:77:88:99", hostName: "Device 6", typeConnection: .WiFi),
            Devices(routerName: "Router 7", ipAddress: "192.168.1.8", isConnected: false, macAddress: "55:66:77:88:99:00", hostName: "Device 7", typeConnection: .WiFi),
            Devices(routerName: "Router 8", ipAddress: "192.168.1.9", isConnected: true, macAddress: "66:77:88:99:00:11", hostName: "Device 8", typeConnection: .WiFi),
            Devices(routerName: "Router 9", ipAddress: "192.168.1.10", isConnected: false, macAddress: "77:88:99:00:11:22", hostName: "Device 9", typeConnection: .WiFi),
            Devices(routerName: "Router 10", ipAddress: "192.168.1.11", isConnected: true, macAddress: "88:99:00:11:22:33", hostName: "Device 10", typeConnection: .WLAN),
            Devices(routerName: "Router 11", ipAddress: "192.168.1.12", isConnected: false, macAddress: "99:00:11:22:33:44", hostName: "Device 11", typeConnection: .WiFi),
            Devices(routerName: "Router 12", ipAddress: "192.168.1.13", isConnected: true, macAddress: "AA:BB:CC:DD:EE:FF", hostName: "Device 12", typeConnection: .WiFi),
            Devices(routerName: "Router 13", ipAddress: "192.168.1.14", isConnected: false, macAddress: "BB:CC:DD:EE:FF:00", hostName: "Device 13", typeConnection: .WiFi),
            Devices(routerName: "Router 14", ipAddress: "192.168.1.15", isConnected: true, macAddress: "CC:DD:EE:FF:00:11", hostName: "Device 14", typeConnection: .WLAN),
            Devices(routerName: "Router 15", ipAddress: "192.168.1.16", isConnected: false, macAddress: "DD:EE:FF:00:11:22", hostName: "Device 15", typeConnection: .WiFi),
            Devices(routerName: "Router 16", ipAddress: "192.168.1.17", isConnected: true, macAddress: "EE:FF:00:11:22:33", hostName: "Device 16", typeConnection: .WiFi),
            Devices(routerName: "Router 17", ipAddress: "192.168.1.18", isConnected: false, macAddress: "FF:00:11:22:33:44", hostName: "Device 17", typeConnection: .WLAN),
            Devices(routerName: "Router 18", ipAddress: "192.168.1.19", isConnected: true, macAddress: "00:11:22:33:44:55", hostName: "Device 18", typeConnection: .WiFi),
            Devices(routerName: "Router 19", ipAddress: "192.168.1.20", isConnected: false, macAddress: "11:22:33:44:55:66", hostName: "Device 19", typeConnection: .WiFi),
            Devices(routerName: "Router 20", ipAddress: "192.168.1.21", isConnected: true, macAddress: "22:33:44:55:66:77", hostName: "Device 20", typeConnection: .WLAN),
            Devices(routerName: "Router 21", ipAddress: "192.168.1.22", isConnected: false, macAddress: "33:44:55:66:77:88", hostName: "Device 21", typeConnection: .WiFi),
            Devices(routerName: "Router 22", ipAddress: "192.168.1.23", isConnected: true, macAddress: "44:55:66:77:88:99", hostName: "Device 22", typeConnection: .WLAN),
            Devices(routerName: "Router 23", ipAddress: "192.168.1.24", isConnected: false, macAddress: "55:66:77:88:99:00", hostName: "Device 23", typeConnection: .WiFi),
            Devices(routerName: "Router 24", ipAddress: "192.168.1.25", isConnected: true, macAddress: "66:77:88:99:00:11", hostName: "Device 24", typeConnection: .WLAN),
            Devices(routerName: "Router 25", ipAddress: "192.168.1.26", isConnected: false, macAddress: "77:88:99:00:11:22", hostName: "Device 25", typeConnection: .WiFi)
        ]
        devices = devicesArray
    }
}
