//
//  BluetoothConstants.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//

import Foundation
import CoreBluetooth

let heartRateServiceCBUUID = CBUUID(string: "0x180D")
let heartRateMeasurementCharacteristicCBUUID = CBUUID(string: "2A37")
let bodySensorLocationCharacteristicCBUUID = CBUUID(string: "2A38")
