//
//  Router.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//

import UIKit

// Class Router confirm RouterProtocol
// Take navigation Controller for routing between View Controllers
// Take assemblyBuilder for build and create View Controller
// Has next funcs:
    // InitialViewController: start screen of App, can connect to heart rate device via BLE protocol
class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssembyProtocol?
    
    // Navigation realized by NavigationController
    // Module building realized by AssemblyBuilder
    init(navigationController: UINavigationController, assemblyBuilder: AssembyProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let trainingViewController = assemblyBuilder?.createTrainingModule(router: self) else { return }
            navigationController.viewControllers = [trainingViewController]
        }
    }

    
    
}

