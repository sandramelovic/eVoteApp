//
//  WelcomeScreen.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 8.3.24..
//

import UIKit

class WelcomeScreen: UIView {
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "еГлас"
        view.accessibilityIdentifier = "text_title"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var startButton: UIButton = {
        let view = UIButton()
        view.setTitle("Покрени услугу", for: .normal)
        view.accessibilityIdentifier = "loginButton"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        styleView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(startButton)
        
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 300).isActive = true
        
        startButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        startButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 200).isActive = true
        
        
    }
    
    private func styleView() {
        
        self.backgroundColor = UIColor(hex: 0x253965)
        
        titleLabel.textColor = UIColor.white
        
        titleLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 70.0)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true;
        titleLabel.minimumScaleFactor = 0.5
        
        startButton.backgroundColor = UIColor.white
        startButton.layer.cornerRadius = 25
        startButton.setTitleColor(UIColor(hex: 0x253965), for: .normal)
        startButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 24.0)

    }
    
}

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
