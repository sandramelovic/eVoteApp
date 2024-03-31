//
//  RegistrationViewController.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 28.3.24..
//

import Parse
import UIKit

class RegistrationViewController: UIViewController {
    
    let registrationView = RegistrationScreen()
    
    var indicatorSignup: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        view = registrationView
        
        let registrationButton = registrationView.registrationButton
        let backButton = registrationView.backButton
        
        indicatorSignup = UIActivityIndicatorView(style: .large)
        indicatorSignup.center = view.center
        indicatorSignup.hidesWhenStopped = true
        view.addSubview(indicatorSignup)
        
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        
        registrationButton.addTarget(self, action: #selector(registrationButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func backButtonTapped(_ sender:UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func registrationButtonTapped(_ sender: UIButton) {
        guard let username = registrationView.usernameRegistrationTextField.text,
              let password = registrationView.passwordRegistrationTextField.text else {
            return
        }
        
        guard username.count >= 5 else {
            AlertUtil.displayAlert(withTitle: "Грешка при регистрацији", message: "Корисничко име мора имати најмање 5 карактера", viewController: self)
            return
        }
        
        guard password.count >= 5 && password.rangeOfCharacter(from: .decimalDigits) != nil else {
            AlertUtil.displayAlert(withTitle: "Грешка при регистрацији", message: "Шифра мора имати најмање 5 карактера и бар једну цифру", viewController: self)
            return
        }
        
        let identityViewController = IdentityViewController()
        
        let user = PFUser()
        user.username = username
        user.password = password
        
        self.indicatorSignup.startAnimating()
        user.signUpInBackground { (succeeded: Bool, error: Error?) in
            self.indicatorSignup.stopAnimating()
            if let error = error {
                AlertUtil.displayAlert(withTitle: "Грешка при регистрацији", message: error.localizedDescription, viewController: self)
            } else {
                self.navigationController?.pushViewController(identityViewController, animated: true)
                AlertUtil.displayAlert(withTitle: "Успешна регистрација", message: "Ваш налог је успешно креиран!", viewController: self)
            }
        }
    }
}
