//
//  HeartRateView.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//

import UIKit

class HeartRateView: UIView {
    
    var trainData: Train = .notConnected {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var heartRateImageView = UIImageView(image: UIImage(named: "WatchWithoutArrow"))
    lazy var arrowImageView = UIImageView(image: UIImage(named: "Arrow"))
    lazy var heartRateLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        customDesign()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customDesign() {
        heartRateLabel.font = .boldSystemFont(ofSize: 50)
        heartRateLabel.textColor = .white
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch trainData {
            
        case .notConnected:
            heartRateLabel.text = "000"
            update(trainData: Train.TrainData(trainHeartRate: 0), isHidden: false)
            
            
        case .connected(let trainData):
            update(trainData: trainData, isHidden: false)
        }
        
        layout()
    }
    
    private func layout() {
        heartRateImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        heartRateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(heartRateImageView)
        addSubview(arrowImageView)
        addSubview(heartRateLabel)

        
        NSLayoutConstraint.activate([
            heartRateImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            heartRateImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            heartRateImageView.widthAnchor.constraint(equalToConstant: 300),
            heartRateImageView.heightAnchor.constraint(equalToConstant: 300),
            arrowImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.heightAnchor.constraint(equalToConstant: 260),
            arrowImageView.widthAnchor.constraint(equalToConstant: 45),
            heartRateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            heartRateLabel.bottomAnchor.constraint(equalTo: heartRateImageView.bottomAnchor, constant: -20),
        ])
    }
    
    private func update(trainData: Train.TrainData, isHidden: Bool) {
        let bpm = trainData.trainHeartRate
        heartRateLabel.text = String(bpm)
        BPMtoDegree(heartRate: bpm)
        
    }
    
    func BPMtoDegree(heartRate: Int) {
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
    
    func rotateImage(rotationAngle: CGFloat) {
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: { [self] () -> Void in
//            setAnchorPoint(CGPoint(x: 0.5, y: 0.86), for: arrowImage)
            self.arrowImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        })
    }
    
}
