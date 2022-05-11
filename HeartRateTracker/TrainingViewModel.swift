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
    
    func startTraning() {
        bluetoothManager?.startSearchingForBleDevice()
    }
    
    func stopTrainig() {
        
    }
    
}
