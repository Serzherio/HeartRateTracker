//
//  TrainingViewModel.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//

import Foundation

protocol TrainingViewModelProtocol {
    var updateViewData: ((Train) -> ())? {get set}
    var updateDeviceStatus: ((Bool) -> ())? {get set}
    var bluetoothManager: BluetoothManagerProtocol? {get set}
    func startTraning()
    func stopTrainig()
}

class TrainingViewModel: TrainingViewModelProtocol {
  
    var bluetoothManager: BluetoothManagerProtocol?
    var updateViewData: ((Train) -> ())?
    var updateDeviceStatus: ((Bool) -> ())?
    
    
    init() {
        updateViewData?(.notConnected)
    }
    func startTraning() {
        updateViewData?(.searching)
        bluetoothManager?.startConnectToDevice()
        bluetoothManager?.delegate = self
    }
    
    func stopTrainig() {
        bluetoothManager?.stopConnectToDevice()
        updateViewData?(.notConnected)
    }
    
}

extension TrainingViewModel: UpdateHeartRateValueProtocol {
    
    func onConnected() {
        updateDeviceStatus?(true)
    }
    
    
    func getHeartRateValue(bpm: Int) {
        updateViewData?(.connected(Train.TrainData(trainHeartRate: bpm)))
    }
    
}
