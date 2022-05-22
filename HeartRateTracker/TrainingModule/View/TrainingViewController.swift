//
//  ViewController.swift
//  HeartRateTracker
//
//  Created by Сергей on 11.05.2022.
//
import UIKit

class TrainingViewController: UIViewController {
    
    // UIElements
    let startTrainingButton = UIButton(type: .system)
    let bpmLabel = HeartRateView()
    let deviceStatusView = ConnectStatusView()
    // Varibles
    var trainingViewModel: TrainingViewModelProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupUIElements()
        startTrainingButton.addTarget(self, action: #selector(startTrainingButtonPressed), for: .touchUpInside)
        deviceStatusView.deviceSwitcher.addTarget(self, action: #selector(deviceSwitcherPressed), for: .touchUpInside)
        updateView()
    }
    
    private func updateView() {
        trainingViewModel?.updateViewData = { [weak self] trainData in
            self?.bpmLabel.trainData = trainData
            self?.deviceStatusView.trainData = trainData
        }
    }

    
    private func setupUIElements() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Bg")!)
        startTrainingButton.setTitle("Start", for: .normal)
        
        bpmLabel.translatesAutoresizingMaskIntoConstraints = false
        startTrainingButton.translatesAutoresizingMaskIntoConstraints = false
        deviceStatusView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(bpmLabel)
        view.addSubview(startTrainingButton)
        view.addSubview(deviceStatusView)

        NSLayoutConstraint.activate([
            bpmLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bpmLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bpmLabel.widthAnchor.constraint(equalToConstant: 300),
            bpmLabel.heightAnchor.constraint(equalToConstant: 300),
            startTrainingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            startTrainingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deviceStatusView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            deviceStatusView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            deviceStatusView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)

        ])
    }
    
    @objc private func startTrainingButtonPressed() {
        trainingViewModel?.startTraning()
    }
    
    @objc private func deviceSwitcherPressed() {
        switch deviceStatusView.deviceSwitcher.isOn {
        case true:
            deviceStatusView.deviceStatusLabel.text = "Searching"
            trainingViewModel?.startTraning()
        case false:
            deviceStatusView.deviceStatusLabel.text = "Disconnected"
            deviceStatusView.deviceStatusLabel.textColor = .cyan
            trainingViewModel?.stopTrainig()
        }
       
    }
    
    @objc private func deviceSearchingSwitched() {

            
    }


}


