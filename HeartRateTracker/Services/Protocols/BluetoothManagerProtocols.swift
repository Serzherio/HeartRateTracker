//
//  BluetoothManagerProtocols.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//

import Foundation

// Get bpm value from device
protocol UpdateHeartRateValueProtocol {
    func getHeartRateValue(bpm: Int)
}

// Service to drive Bluetooth Managers
protocol BluetoothManagerProtocol {
    func startConnectToDevice()
    func stopConnectToDevice()
    var delegate: UpdateHeartRateValueProtocol? { get set }
}
