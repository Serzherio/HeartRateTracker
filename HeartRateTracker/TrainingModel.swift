//
//  TrainingModel.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//

import Foundation

class Train {
    let trainDate: Date
    let trainDuring: Int
    let trainHeartRate: [Int]?
    
    init(trainDate: Date, trainDuring: Int, trainHeartRate: [Int]?) {
        self.trainDate = trainDate
        self.trainDuring = trainDuring
        self.trainHeartRate = trainHeartRate
    }
}
