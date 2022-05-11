//
//  AssemblyBuilder.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//


import UIKit

protocol AssembyProtocol: AnyObject {
    func createTrainingModule(router: RouterProtocol, bluetoothManager: BluetoothManagerProtocol) -> UIViewController
}

class AssembyBuilder: AssembyProtocol {
    func createTrainingModule(router: RouterProtocol, bluetoothManager: BluetoothManagerProtocol) -> UIViewController {
        let view = TrainingViewController()
        let bluetoothManager = BluetoothManager()
        let trainingViewModel = TrainingViewModel()
        trainingViewModel.bluetoothManager = bluetoothManager
        view.trainingViewModel = trainingViewModel
        return view
    }
    
    
}
