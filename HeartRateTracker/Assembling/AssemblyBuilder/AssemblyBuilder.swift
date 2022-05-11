//
//  AssemblyBuilder.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//

import UIKit

// Class AssembyBuilder comfirm AssembyProtocol
// Build and inject dependencies in modules
// Funcs:
    // createTrainingModule:
        // DI:  view, bluetoothManager, trainingViewModel
class AssembyBuilder: AssembyProtocol {
    func createTrainingModule(router: RouterProtocol) -> UIViewController {
        let view = TrainingViewController()
        let bluetoothManager = BluetoothManager()
        let trainingViewModel = TrainingViewModel()
        trainingViewModel.bluetoothManager = bluetoothManager
        view.trainingViewModel = trainingViewModel
        return view
    }
}
