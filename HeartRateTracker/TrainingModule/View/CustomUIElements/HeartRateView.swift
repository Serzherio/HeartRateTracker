//
//  HeartRateView.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//

import UIKit

class HeartRateView: UIView {
    
    // Data driven var. Change UI in habbit of incoming Data
    var trainData: Train = .notConnected {
        didSet {
            setNeedsLayout()
        }
    }
    lazy var heartRateImageView = UIImageView(image: UIImage(named: "WatchWithoutArrow"))
    lazy var arrowImageView = UIImageView(image: UIImage(named: "Arrow"))
    lazy var heartRateLabel = UILabel(textLabel: "0", font: .noteworthy50())
    
    // Init HeartRateView
    init() {
        super.init(frame: .zero)
        customDesign()
        customLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Looking for incoming Data type
    // Update UI
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch trainData {
        case .notConnected:
            update(trainData: Train.TrainData(trainHeartRate: 0), isHidden: false)
        case .connected(let trainData):
            update(trainData: trainData, isHidden: false)
        }
        //customLayout()
    }
 
    private func update(trainData: Train.TrainData, isHidden: Bool) {
        let bpm = trainData.trainHeartRate
        heartRateLabel.text = String(bpm)
        RotateArrowByBPM(heartRate: bpm)
        
    }
    
    // MARK: - Rotate view animations
    // Calculate rotate angle from BPM rate
    private func RotateArrowByBPM(heartRate: Int) {
        var angle: CGFloat
        if heartRate < 70 {
            angle = CGFloat( Double(70-140) * (Double.pi/80) )
        } else if heartRate > 210 {
            angle = CGFloat( Double(210-140) * (Double.pi/80) )
        } else {
            angle = CGFloat( Double(heartRate-140) * (Double.pi/80) )
        }
        rotateImage(rotationAngle: angle)
    }
    
    // Rotate arrow animation
    private func rotateImage(rotationAngle: CGFloat) {
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: { [self] () -> Void in
            self.arrowImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        })
    }
}
