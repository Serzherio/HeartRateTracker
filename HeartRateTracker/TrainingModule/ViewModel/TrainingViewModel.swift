//
//  TrainingViewModel.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//

import Foundation

protocol TrainingViewModelProtocol {
    var updateViewData: ((Train) -> ())? {get set}
    var bluetoothManager: BluetoothManagerProtocol? {get set}
    func startTraning()
    func stopTrainig()
}

class TrainingViewModel: TrainingViewModelProtocol {

    var bluetoothManager: BluetoothManagerProtocol?
    var updateViewData: ((Train) -> ())?
    
    init() {
        updateViewData?(.notConnected)
    }
    func startTraning() {
        bluetoothManager?.startConnectToDevice()
        bluetoothManager?.delegate = self
    }
    
    func stopTrainig() {
        bluetoothManager?.stopConnectToDevice()
    }
    
}

extension TrainingViewModel: UpdateHeartRateValueProtocol {
    
    func getHeartRateValue(bpm: Int) {
        print(bpm)
        updateViewData?(.connected(Train.TrainData(trainHeartRate: bpm)))
    }
    
}
