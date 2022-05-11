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
    // Varibles
    var trainingViewModel: TrainingViewModelProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupUIElements()
        startTrainingButton.addTarget(self, action: #selector(startTrainingButtonPressed), for: .touchUpInside)
        updateView()
    }
    
    private func updateView() {
        trainingViewModel?.updateViewData = { [weak self] trainData in
        self?.bpmLabel.trainData = trainData
            
        }
//        viewModel.updateViewDataModel = { [weak self] viewDataModel in
//            self?.testView.viewDataModel = viewDataModel
//        }
    }

    
    private func setupUIElements() {
        startTrainingButton.setTitle("Start", for: .normal)
        bpmLabel.translatesAutoresizingMaskIntoConstraints = false
        startTrainingButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bpmLabel)
        view.addSubview(startTrainingButton)
        
        NSLayoutConstraint.activate([
            bpmLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bpmLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bpmLabel.widthAnchor.constraint(equalToConstant: 300),
            bpmLabel.heightAnchor.constraint(equalToConstant: 300),
            startTrainingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            startTrainingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func startTrainingButtonPressed() {
        trainingViewModel?.startTraning()
    }


}


