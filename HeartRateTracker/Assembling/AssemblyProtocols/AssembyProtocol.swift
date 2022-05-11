//
//  AssembyProtocol.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//

import UIKit

// protocol for build App modules
protocol AssembyProtocol: AnyObject {
    func createTrainingModule(router: RouterProtocol) -> UIViewController
}
