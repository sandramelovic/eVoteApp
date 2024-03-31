//
//  IdentityScreen.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 11.3.24..
//

import UIKit

class IdentityScreen: UIView {

    var voteSteps: VoteSteps?
    
    lazy var steps: VoteSteps = {
        let view = VoteSteps()
        view.accessibilityIdentifier = "steps"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var registrationButton: UIButton = {
        let view = UIButton()
        view.setTitle("Региструј се", for: .normal)
        view.accessibilityIdentifier = "registrationButton"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var loginLabel: UILabel = {
            let view = UILabel()
            view.text = "...или се пријави"
            view.accessibilityIdentifier = "loginLabel"
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var usernameLoginLabel: UILabel = {
            let view = UILabel()
            view.text = "Корисничко име:"
            view.accessibilityIdentifier = "usernameLoginLabel"
            view.translatesAutoresizingMaskIntoConstraints = false
        view.becomeFirstResponder()
            return view
        }()
    
    lazy var usernameLoginTextField: UITextField = {
            let view = UITextField()
            view.accessibilityIdentifier = "usernameLoginTextField"
            view.autocorrectionType = .no
            view.autocapitalizationType = .none
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var passwordLoginLabel: UILabel = {
            let view = UILabel()
            view.text = "Лозинка:"
            view.accessibilityIdentifier = "passwordLoginLabel"
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var passwordLoginTextField: UITextField = {
            let view = UITextField()
            view.accessibilityIdentifier = "passwordLoginTextField"
            view.autocorrectionType = .no
            view.autocapitalizationType = .none
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Започни гласање", for: .normal)
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
    
    func setupView(){
        addSubview(steps)
        voteSteps = steps
        addSubview(registrationButton)
        addSubview(loginLabel)
        addSubview(usernameLoginLabel)
        addSubview(usernameLoginTextField)
        addSubview(passwordLoginLabel)
        addSubview(passwordLoginTextField)
        addSubview(loginButton)
        
        steps.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        steps.heightAnchor.constraint(equalToConstant: 80).isActive = true
        steps.widthAnchor.constraint(equalToConstant: 500).isActive = true
        steps.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        registrationButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        registrationButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        registrationButton.topAnchor.constraint(equalTo: steps.bottomAnchor, constant: 220).isActive = true
        
        loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginLabel.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 30).isActive = true
        
        usernameLoginLabel.topAnchor.constraint(equalTo: registrationButton.bottomAnchor, constant: 80).isActive = true
        usernameLoginLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        usernameLoginTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        usernameLoginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        usernameLoginTextField.widthAnchor.constraint(equalToConstant: 370).isActive = true
        usernameLoginTextField.topAnchor.constraint(equalTo: usernameLoginLabel.bottomAnchor, constant: 10).isActive = true
        
        passwordLoginLabel.topAnchor.constraint(equalTo: usernameLoginTextField.bottomAnchor, constant: 30).isActive = true
        passwordLoginLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        passwordLoginTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordLoginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordLoginTextField.widthAnchor.constraint(equalToConstant: 370).isActive = true
        passwordLoginTextField.topAnchor.constraint(equalTo: passwordLoginLabel.bottomAnchor, constant: 10).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -170).isActive = true
    }
    
    func styleView(){
    
        self.backgroundColor = UIColor(hex: 0xEAEAEA)
        
        registrationButton.backgroundColor = UIColor(hex: 0x253965)
        registrationButton.layer.cornerRadius = 20
        registrationButton.layer.borderWidth = 1
        registrationButton.setTitleColor(UIColor.white, for: .normal)
        registrationButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 20.0)
        
        loginLabel.textColor = UIColor(hex: 0x253965)
        loginLabel.font = UIFont(name: "AmericanTypewriter", size: 15.0)
        
        usernameLoginLabel.textColor = UIColor(hex: 0x253965)
        usernameLoginLabel.font = UIFont(name: "AmericanTypewriter", size: 20.0)

        usernameLoginTextField.backgroundColor = UIColor.white
        usernameLoginTextField.layer.cornerRadius = 15
        usernameLoginTextField.textColor = UIColor(hex: 0x253965)
        usernameLoginTextField.layer.borderWidth = 2
        usernameLoginTextField.layer.borderColor = UIColor(hex: 0x253965).cgColor
        usernameLoginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        usernameLoginTextField.leftViewMode = .always
        usernameLoginTextField.textAlignment = .left
        
        passwordLoginLabel.textColor = UIColor(hex: 0x253965)
        passwordLoginLabel.font = UIFont(name: "AmericanTypewriter", size: 20.0)
        
        passwordLoginTextField.backgroundColor = UIColor.white
        passwordLoginTextField.layer.cornerRadius = 15
        passwordLoginTextField.textColor = UIColor(hex: 0x253965)
        passwordLoginTextField.layer.borderWidth = 2
        passwordLoginTextField.layer.borderColor = UIColor(hex: 0x253965).cgColor
        passwordLoginTextField.isSecureTextEntry = true
        passwordLoginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        passwordLoginTextField.leftViewMode = .always
        passwordLoginTextField.textAlignment = .left
        
        loginButton.backgroundColor = UIColor(hex: 0x253965)
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 1
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 20.0)
        
    }
    
    

}
