//
//  HeartRateView + Extension.swift
//  HeartRateTracker
//
//  Created by Сергей on 12.05.2022.
//

import UIKit

extension HeartRateView {
    
    func customDesign() {
        heartRateLabel.font = .boldSystemFont(ofSize: 50)
        heartRateLabel.textColor = .white
    }
    
    func customLayout() {
        
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
    
}
