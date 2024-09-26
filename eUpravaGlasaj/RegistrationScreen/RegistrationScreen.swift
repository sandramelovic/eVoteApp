//
//  RegistrationScreen.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 28.3.24..
//

import UIKit

class RegistrationScreen: UIView {
    
    lazy var backButton: UIButton = {
        let view = UIButton()
        view.accessibilityIdentifier = "backButton"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.setImage(UIImage(named: "backButton"), for: .normal)
        return view
    }()
    
    lazy var titleRegistrationLabel: UILabel = {
            let view = UILabel()
            view.text = "Креирај налог"
            view.accessibilityIdentifier = "titleRegistrationLabel"
            view.translatesAutoresizingMaskIntoConstraints = false
        view.becomeFirstResponder()
            return view
        }()

    lazy var nameRegistrationLabel: UILabel = {
            let view = UILabel()
            view.text = "Име:"
            view.accessibilityIdentifier = "nameRegistrationLabel"
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var nameRegistrationTextField: UITextField = {
            let view = UITextField()
            view.accessibilityIdentifier = "nameRegistrationTextField"
            view.autocorrectionType = .no
            view.autocapitalizationType = .none
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var surenameRegistrationLabel: UILabel = {
            let view = UILabel()
            view.text = "Презиме:"
            view.accessibilityIdentifier = "surenameRegistrationLabel"
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var surenameRegistrationTextField: UITextField = {
            let view = UITextField()
            view.accessibilityIdentifier = "surenameRegistrationTextField"
            view.autocorrectionType = .no
            view.autocapitalizationType = .none
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    
    lazy var usernameRegistrationLabel: UILabel = {
            let view = UILabel()
            view.text = "Корисничко име:"
            view.accessibilityIdentifier = "usernameRegistrationLabel"
            view.translatesAutoresizingMaskIntoConstraints = false
        view.becomeFirstResponder()
            return view
        }()
    
    lazy var usernameRegistrationTextField: UITextField = {
            let view = UITextField()
            view.accessibilityIdentifier = "usernameRegistrationTextField"
            view.autocorrectionType = .no
            view.autocapitalizationType = .none
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var passwordRegistrationLabel: UILabel = {
            let view = UILabel()
            view.text = "Лозинка:"
            view.accessibilityIdentifier = "passwordRegistrationLabel"
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var passwordRegistrationTextField: UITextField = {
            let view = UITextField()
            view.accessibilityIdentifier = "passwordRegistrationTextField"
            view.autocorrectionType = .no
            view.autocapitalizationType = .none
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var jmbgRegistrationLabel: UILabel = {
            let view = UILabel()
            view.text = "ЈМБГ:"
            view.accessibilityIdentifier = "jmbgRegistrationLabel"
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var jmbgRegistrationTextField: UITextField = {
            let view = UITextField()
            view.accessibilityIdentifier = "jmbgRegistrationTextField"
            view.autocorrectionType = .no
            view.autocapitalizationType = .none
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var registrationButton: UIButton = {
        let view = UIButton()
        view.setTitle("Rегиструј се", for: .normal)
        view.accessibilityIdentifier = "registrationButton"
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
        addSubview(backButton)
        addSubview(titleRegistrationLabel)
        addSubview(usernameRegistrationLabel)
        addSubview(usernameRegistrationTextField)
        addSubview(passwordRegistrationLabel)
        addSubview(passwordRegistrationTextField)
        addSubview(jmbgRegistrationLabel)
        addSubview(jmbgRegistrationTextField)
        addSubview(nameRegistrationLabel)
        addSubview(nameRegistrationTextField)
        addSubview(surenameRegistrationLabel)
        addSubview(surenameRegistrationTextField)
        addSubview(registrationButton)
        
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        
        titleRegistrationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        titleRegistrationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        nameRegistrationLabel.topAnchor.constraint(equalTo: titleRegistrationLabel.bottomAnchor, constant: 30).isActive = true
        nameRegistrationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        nameRegistrationTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameRegistrationTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameRegistrationTextField.widthAnchor.constraint(equalToConstant: 370).isActive = true
        nameRegistrationTextField.topAnchor.constraint(equalTo: nameRegistrationLabel.bottomAnchor, constant: 10).isActive = true
        
        surenameRegistrationLabel.topAnchor.constraint(equalTo: nameRegistrationTextField.bottomAnchor, constant: 15).isActive = true
        surenameRegistrationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        surenameRegistrationTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        surenameRegistrationTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        surenameRegistrationTextField.widthAnchor.constraint(equalToConstant: 370).isActive = true
        surenameRegistrationTextField.topAnchor.constraint(equalTo: surenameRegistrationLabel.bottomAnchor, constant: 10).isActive = true
        
        jmbgRegistrationLabel.topAnchor.constraint(equalTo: surenameRegistrationTextField.bottomAnchor, constant: 15).isActive = true
        jmbgRegistrationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        jmbgRegistrationTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        jmbgRegistrationTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        jmbgRegistrationTextField.widthAnchor.constraint(equalToConstant: 370).isActive = true
        jmbgRegistrationTextField.topAnchor.constraint(equalTo: jmbgRegistrationLabel.bottomAnchor, constant: 10).isActive = true
        
        
        usernameRegistrationLabel.topAnchor.constraint(equalTo: jmbgRegistrationTextField.bottomAnchor, constant: 15).isActive = true
        usernameRegistrationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        usernameRegistrationTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        usernameRegistrationTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        usernameRegistrationTextField.widthAnchor.constraint(equalToConstant: 370).isActive = true
        usernameRegistrationTextField.topAnchor.constraint(equalTo: usernameRegistrationLabel.bottomAnchor, constant: 10).isActive = true
        
        
        passwordRegistrationLabel.topAnchor.constraint(equalTo: usernameRegistrationTextField.bottomAnchor, constant: 15).isActive = true
        passwordRegistrationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        passwordRegistrationTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordRegistrationTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordRegistrationTextField.widthAnchor.constraint(equalToConstant: 370).isActive = true
        passwordRegistrationTextField.topAnchor.constraint(equalTo: passwordRegistrationLabel.bottomAnchor, constant: 10).isActive = true
        
        
        registrationButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        registrationButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        registrationButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -130).isActive = true
    }
    
    func styleView(){
    
        self.backgroundColor = UIColor(hex: 0xEAEAEA)
        
        titleRegistrationLabel.textColor = UIColor(hex: 0x253965)
        titleRegistrationLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 30.0)
        
        nameRegistrationLabel.textColor = UIColor(hex: 0x253965)
        nameRegistrationLabel.font = UIFont(name: "AmericanTypewriter", size: 20.0)

        nameRegistrationTextField.backgroundColor = UIColor.white
        nameRegistrationTextField.layer.cornerRadius = 15
        nameRegistrationTextField.textColor = UIColor(hex: 0x253965)
        nameRegistrationTextField.layer.borderWidth = 2
        nameRegistrationTextField.layer.borderColor = UIColor(hex: 0x253965).cgColor
        nameRegistrationTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        nameRegistrationTextField.leftViewMode = .always
        nameRegistrationTextField.textAlignment = .left
        
        surenameRegistrationLabel.textColor = UIColor(hex: 0x253965)
        surenameRegistrationLabel.font = UIFont(name: "AmericanTypewriter", size: 20.0)

        surenameRegistrationTextField.backgroundColor = UIColor.white
        surenameRegistrationTextField.layer.cornerRadius = 15
        surenameRegistrationTextField.textColor = UIColor(hex: 0x253965)
        surenameRegistrationTextField.layer.borderWidth = 2
        surenameRegistrationTextField.layer.borderColor = UIColor(hex: 0x253965).cgColor
        surenameRegistrationTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        surenameRegistrationTextField.leftViewMode = .always
        surenameRegistrationTextField.textAlignment = .left
        
        usernameRegistrationLabel.textColor = UIColor(hex: 0x253965)
        usernameRegistrationLabel.font = UIFont(name: "AmericanTypewriter", size: 20.0)

        usernameRegistrationTextField.backgroundColor = UIColor.white
        usernameRegistrationTextField.layer.cornerRadius = 15
        usernameRegistrationTextField.textColor = UIColor(hex: 0x253965)
        usernameRegistrationTextField.layer.borderWidth = 2
        usernameRegistrationTextField.layer.borderColor = UIColor(hex: 0x253965).cgColor
        usernameRegistrationTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        usernameRegistrationTextField.leftViewMode = .always
        usernameRegistrationTextField.textAlignment = .left
        
        passwordRegistrationLabel.textColor = UIColor(hex: 0x253965)
        passwordRegistrationLabel.font = UIFont(name: "AmericanTypewriter", size: 20.0)
        
        passwordRegistrationTextField.backgroundColor = UIColor.white
        passwordRegistrationTextField.layer.cornerRadius = 15
        passwordRegistrationTextField.textColor = UIColor(hex: 0x253965)
        passwordRegistrationTextField.layer.borderWidth = 2
        passwordRegistrationTextField.layer.borderColor = UIColor(hex: 0x253965).cgColor
        passwordRegistrationTextField.isSecureTextEntry = true
        passwordRegistrationTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        passwordRegistrationTextField.leftViewMode = .always
        passwordRegistrationTextField.textAlignment = .left
        
        jmbgRegistrationLabel.textColor = UIColor(hex: 0x253965)
        jmbgRegistrationLabel.font = UIFont(name: "AmericanTypewriter", size: 20.0)
        
        jmbgRegistrationTextField.backgroundColor = UIColor.white
        jmbgRegistrationTextField.layer.cornerRadius = 15
        jmbgRegistrationTextField.textColor = UIColor(hex: 0x253965)
        jmbgRegistrationTextField.layer.borderWidth = 2
        jmbgRegistrationTextField.layer.borderColor = UIColor(hex: 0x253965).cgColor
        jmbgRegistrationTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        jmbgRegistrationTextField.leftViewMode = .always
        jmbgRegistrationTextField.textAlignment = .left
        
        registrationButton.backgroundColor = UIColor(hex: 0x253965)
        registrationButton.layer.cornerRadius = 20
        registrationButton.layer.borderWidth = 1
        registrationButton.setTitleColor(UIColor.white, for: .normal)
        registrationButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 20.0)
        
    }
    
    
    
}
