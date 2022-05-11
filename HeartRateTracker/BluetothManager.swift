//
//  BluetoothManager.swift
//  TrainingTracker
//
//  Created by Сергей on 10.05.2022.
//

import UIKit
import CoreBluetooth


protocol BluetoothManagerProtocol {
    func startSearchingForBleDevice()
}


class BluetoothManager: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate, BluetoothManagerProtocol {

    var centralManager: CBCentralManager!
    var heartRatePeripheral: CBPeripheral!
    
    func startSearchingForBleDevice() {
        centralManager = CBCentralManager(delegate: self, queue: nil)
        centralManager.scanForPeripherals(withServices: [heartRateServiceCBUUID])
    }
    
    // States of centralManager
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print ("central.state is unknown")
        case .resetting:
            print ("central.state is resetting")
        case .unsupported:
            print ("central.state is unsupported")
        case .unauthorized:
            print ("central.state is unauthorized")
        case .poweredOff:
            print ("central.state is poweredOff")
        case .poweredOn:
            print ("central.state is poweredOn")
            centralManager.scanForPeripherals(withServices: [heartRateServiceCBUUID])
        @unknown default:
            print("error Ble")
        }
    }
    
    //  Notifies the delegate that the central manager has detected a peripheral during a scan.
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        //  Peripheral device detected
        heartRatePeripheral = peripheral
        heartRatePeripheral.delegate = self
        centralManager.stopScan()
        centralManager.connect(heartRatePeripheral)
    }
    
    //  Notifies the delegate that the central manager has been connected to a peripheral
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        //  Discovery of specified peripheral device services
        //  Returns only those services that match the provided UUIDs for the search
        heartRatePeripheral.discoverServices([heartRateServiceCBUUID])
    print("connected")
    }
    
    //  Notifies the delegate that peripheral service discovery was successful
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        //  Getting access to peripheral services
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    //  Tell the delegate that the peripheral has found characteristics for the service
    //  Peripheral - the peripheral that provides this information
    //  Service - the service to which the characteristics belong
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        //  Services can be accessed through the service's characteristic property
        guard let characteristics = service.characteristics else { return }
        for characteristic in characteristics {
            if characteristic.properties.contains(.read) {
                //  Retrieves the value of the specified characteristic
                peripheral.readValue(for: characteristic)
            }
            if characteristic.properties.contains(.notify) {
                //  Notify for characteristic
                peripheral.setNotifyValue(true, for: characteristic)
            }
        }
    }
    
    //  Notifies the delegate that the value of the specified characteristic was received successfully, or that the value of the characteristic has changed.
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic,
                    error: Error?) {
            switch characteristic.uuid {
            case heartRateMeasurementCharacteristicCBUUID:
                let bpm = self.heartRate(from: characteristic)
                print(bpm)
            default:
                break
            }
    }
    
    
    // Characteristics of receiving heart rate for various formats of received information (2 bytes / 1 byte)
    private func heartRate(from characteristic: CBCharacteristic) -> Int {
        guard let characteristicData = characteristic.value else { return -1 }
        let byteArray = [UInt8](characteristicData)
        let firstBitValue = byteArray[0] & 0x01
        if firstBitValue == 0 {
            return Int(byteArray[1])
        } else {
            return (Int(byteArray[1]) << 8) + Int(byteArray[2])
        }
    }

}
