//
//  TrainingModel.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//

import Foundation

enum Train {
    case notConnected
    case connected(TrainData)
    
    struct TrainData {
        let trainHeartRate: Int
    }
}
