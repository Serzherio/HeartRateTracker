//
//  RouterProtocols.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//

import UIKit

protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssembyProtocol? { get set}
}

protocol RouterProtocol: RouterMainProtocol {
    func initialViewController(bluetoothManager: BluetoothManagerProtocol)
}
    
