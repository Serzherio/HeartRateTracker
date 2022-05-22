//
//  ConnectStatusView.swift
//  HeartRateTracker
//
//  Created by Сергей on 22.05.2022.
//

import UIKit

class ConnectStatusView: UIView {
    
    // Data driven var. Change UI in habbit of incoming Data
    var trainData: Train = .notConnected {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var deviceStatusLabel = UILabel(textLabel: "Not connected", font: .noteworthy24(), textColor: .cyan)
    lazy var deviceSwitcher = UISwitch()
    
    init() {
        super.init(frame: .zero)
        customLayout()
        customDesign()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch trainData {
        case .notConnected:
            self.deviceStatusLabel.text = "Not connected"
            self.deviceStatusLabel.textColor = .cyan
            self.deviceSwitcher.isOn = false
        case .searching:
            self.deviceStatusLabel.text = "Searching"
        case .connected(_):
            self.deviceStatusLabel.text = "Connected"
            self.deviceStatusLabel.textColor = .green
            self.deviceSwitcher.isOn = true
        }
    }
    
    func customDesign() {
        deviceSwitcher.onTintColor = .cyan
    }
    
    func customLayout() {
        deviceStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        deviceSwitcher.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(deviceSwitcher)
        addSubview(deviceStatusLabel)
       

        NSLayoutConstraint.activate([
            deviceSwitcher.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            deviceSwitcher.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            deviceStatusLabel.centerYAnchor.constraint(equalTo: deviceSwitcher.centerYAnchor),
            deviceStatusLabel.leadingAnchor.constraint(equalTo: deviceSwitcher.trailingAnchor, constant: 20),
            deviceSwitcher.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
