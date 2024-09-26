//
//  WelcomeScreen.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 8.3.24..
//

import UIKit

class VoteSteps: UIView {
    
    lazy var stepView: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = "stepView"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
            
    lazy var backButton: UIButton = {
        let view = UIButton()
        view.accessibilityIdentifier = "backButton"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.setImage(UIImage(named: "backButton"), for: .normal)
        return view
    }()
    
    lazy var logoutButton: UIButton = {
        let view = UIButton()
        view.accessibilityIdentifier = "logoutButton"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.setImage(UIImage(named: "logoutButton"), for: .normal)
        return view
    }()
    
    lazy var steps: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = "steps"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var step2: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = "step2"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var step2Label: UILabel = {
        let view = UILabel()
        view.text = "2"
        view.accessibilityIdentifier = "step2Label"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var step2UnderLabel: UILabel = {
        let view = UILabel()
        view.text = "Гласај"
        view.accessibilityIdentifier = "step2UnderLabel"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var step1: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = "step1"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var step1Label: UILabel = {
        let view = UILabel()
        view.text = "1"
        view.accessibilityIdentifier = "step1Label"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var step1UnderLabel: UILabel = {
        let view = UILabel()
        view.text = "Идентификација"
        view.accessibilityIdentifier = "step1UnderLabel"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var step3: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = "step3"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var step3Label: UILabel = {
        let view = UILabel()
        view.text = "3"
        view.accessibilityIdentifier = "step3Label"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var step3UnderLabel: UILabel = {
        let view = UILabel()
        view.text = "Потврди"
        view.accessibilityIdentifier = "step3UnderLabel"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dottedLine1: CAShapeLayer = {
        let view = CAShapeLayer()
        return view
    }()
    
    let path1 = CGMutablePath()
    
    let dottedLine2: CAShapeLayer = {
        let view = CAShapeLayer()
        return view
    }()
    
    let path2 = CGMutablePath()
    
    lazy var identificationLabel: UILabel = {
        let view = UILabel()
        view.text = "Корак 1: Идентификација"
        view.accessibilityIdentifier = "identificationLabel"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let line: CAShapeLayer = {
        let view = CAShapeLayer()
        return view
    }()
    
    let linePath = CGMutablePath()
            
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        styleView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(stepView)
        stepView.addSubview(backButton)
        stepView.addSubview(steps)
        stepView.addSubview(logoutButton)
        steps.addSubview(step2)
        steps.addSubview(step1)
        steps.addSubview(step3)
        step2.addSubview(step2Label)
        step1.addSubview(step1Label)
        step3.addSubview(step3Label)
        steps.layer.addSublayer(dottedLine1)
        steps.layer.addSublayer(dottedLine2)
        steps.addSubview(step1UnderLabel)
        steps.addSubview(step2UnderLabel)
        steps.addSubview(step3UnderLabel)
        stepView.addSubview(identificationLabel)
        self.layer.addSublayer(line)
        
        stepView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stepView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        stepView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        stepView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        
        logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logoutButton.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true


        steps.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        steps.heightAnchor.constraint(equalToConstant: 80).isActive = true
        steps.widthAnchor.constraint(equalToConstant: 500).isActive = true
        steps.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        
        step2.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        step2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        step2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        step2.centerYAnchor.constraint(equalTo: steps.centerYAnchor).isActive = true
        
        step2UnderLabel.centerYAnchor.constraint(equalTo: step2.bottomAnchor, constant: 10).isActive = true
        step2UnderLabel.centerXAnchor.constraint(equalTo: step2.centerXAnchor).isActive = true
        
        step2Label.centerXAnchor.constraint(equalTo: step2.centerXAnchor).isActive = true
        step2Label.centerYAnchor.constraint(equalTo: step2.centerYAnchor).isActive = true
        
        step1.rightAnchor.constraint(equalTo: step2.leftAnchor, constant: -90).isActive = true
        step1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        step1.widthAnchor.constraint(equalToConstant: 50).isActive = true
        step1.centerYAnchor.constraint(equalTo: steps.centerYAnchor).isActive = true
        
        step1UnderLabel.centerYAnchor.constraint(equalTo: step1.bottomAnchor, constant: 10).isActive = true
        step1UnderLabel.centerXAnchor.constraint(equalTo: step1.centerXAnchor).isActive = true
        
        step1Label.centerXAnchor.constraint(equalTo: step1.centerXAnchor).isActive = true
        step1Label.centerYAnchor.constraint(equalTo: step1.centerYAnchor).isActive = true
        
        step3.leftAnchor.constraint(equalTo: step2.rightAnchor, constant: 90).isActive = true
        step3.heightAnchor.constraint(equalToConstant: 50).isActive = true
        step3.widthAnchor.constraint(equalToConstant: 50).isActive = true
        step3.centerYAnchor.constraint(equalTo: steps.centerYAnchor).isActive = true
        
        step3UnderLabel.centerYAnchor.constraint(equalTo: step3.bottomAnchor, constant: 10).isActive = true
        step3UnderLabel.centerXAnchor.constraint(equalTo: step3.centerXAnchor).isActive = true

        step3Label.centerXAnchor.constraint(equalTo: step3.centerXAnchor).isActive = true
        step3Label.centerYAnchor.constraint(equalTo: step3.centerYAnchor).isActive = true
        
        identificationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        identificationLabel.bottomAnchor.constraint(equalTo: stepView.bottomAnchor, constant: -10).isActive = true
        
       
        
       
    }
    
    private func styleView() {
        
        stepView.backgroundColor = UIColor.white
                
        step2.backgroundColor = UIColor(hex: 0x253965)
        step2.layer.cornerRadius = 50/2
        
        step2Label.textColor = UIColor.white
        step2Label.font = UIFont(name: "Arial-BoldMT", size: 30.0)
        
        step2UnderLabel.font = UIFont(name: "AmericanTypewriter", size: 10.0)
                
        step1.backgroundColor = UIColor(hex: 0x253965)
        step1.layer.cornerRadius = 50/2
        
        step1Label.textColor = UIColor.white
        step1Label.font = UIFont(name: "Arial-BoldMT", size: 30.0)
        
        step1UnderLabel.font = UIFont(name: "AmericanTypewriter", size: 10.0)

        step3.backgroundColor = UIColor(hex: 0x253965)
        step3.layer.cornerRadius = 50/2
        
        step3Label.textColor = UIColor.white
        step3Label.font = UIFont(name: "Arial-BoldMT", size: 30.0)
        
        step3UnderLabel.font = UIFont(name: "AmericanTypewriter", size: 10.0)

        path1.addLines(between: [CGPoint(x: 140, y: 40), CGPoint(x: 220, y: 40)])
        
        dottedLine1.strokeColor = UIColor(hex: 0x253965).cgColor
        dottedLine1.lineWidth = 10
        dottedLine1.lineDashPattern = [10, 7.5]
        dottedLine1.path = path1
       
        path2.addLines(between: [CGPoint(x: 280, y: 40), CGPoint(x: 360, y: 40)])
        
        dottedLine2.strokeColor = UIColor(hex: 0x253965).cgColor
        dottedLine2.lineWidth = 10
        dottedLine2.lineDashPattern = [10, 7.5]
        dottedLine2.path = path2
        
        identificationLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 20.0)

        linePath.addLines(between: [CGPoint(x: self.frame.width, y: 250), CGPoint(x: 450, y: 250)])

        line.strokeColor = UIColor(hex: 0x253965).cgColor
        line.lineWidth = 5
        line.path = linePath
    }
    
}

