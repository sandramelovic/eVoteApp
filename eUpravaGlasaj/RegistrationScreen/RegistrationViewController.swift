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
    
    let jmbgInfo = ""
    
    var indicatorSignup: UIActivityIndicatorView!
    
    private var keyboardHandler: KeyboardHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let registrationButton = registrationView.registrationButton
        let backButton = registrationView.backButton
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        indicatorSignup = UIActivityIndicatorView(style: .large)
        indicatorSignup.center = view.center
        indicatorSignup.hidesWhenStopped = true
        view.addSubview(indicatorSignup)
        
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        
        registrationButton.addTarget(self, action: #selector(registrationButtonTapped(_:)), for: .touchUpInside)
        
        keyboardHandler = KeyboardHandler(view: self.view)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func loadView() {
        view = registrationView
    }
    
    @objc func backButtonTapped(_ sender:UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func registrationButtonTapped(_ sender: UIButton) {
        guard let name = registrationView.nameRegistrationTextField.text,
              let surename = registrationView.surenameRegistrationTextField.text,
              let username = registrationView.usernameRegistrationTextField.text,
              let password = registrationView.passwordRegistrationTextField.text,
              let jmbg = registrationView.jmbgRegistrationTextField.text else {
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
        
        guard let (jmbgInfo, errorMessage) = validateJMBG(jmbg) else {
            showAlert(message: "Invalid JMBG")
            return
        }
        
        guard let jmbgInfo = jmbgInfo else {
            showAlert(message: errorMessage)
            return
        }
        
        
        let query = PFQuery(className: "_User")
        query.whereKey("jmbg", equalTo: jmbg)
        query.getFirstObjectInBackground { (object, error) in
            if let _ = object {
                AlertUtil.displayAlert(withTitle: "Грешка при регистрацији", message: "Корисник са датим ЈМБГ-ом већ постоји.", viewController: self)
            } else {
                let identityViewController = IdentityViewController()
                
                let user = PFUser()
                user.username = username
                user.password = password
                user["name"] = name
                user["surename"] = surename
                user["gender"] = jmbgInfo.gender.rawValue
                user["dateOfBirth"] = jmbgInfo.dateOfBirth
                user["regionName"] = jmbgInfo.region.name
                user["regionCity"] = jmbgInfo.region.city
                user["jmbg"] = jmbg
                user["vote"] = ""
                user["role"] = "user"
                
                self.indicatorSignup.startAnimating()
                user.signUpInBackground { (succeeded: Bool, error: Error?) in
                    self.indicatorSignup.stopAnimating()
                    if let error = error {
                        AlertUtil.displayAlert(withTitle: "Грешка при регистрацији", message: error.localizedDescription, viewController: self)
                    } else {
                        self.navigationController?.pushViewController(identityViewController, animated: true)
                        
                        let successMessage = """
                           Ваш налог је успешно креиран са следећим подацима:
                           _______________________________
                           Име: \(name)
                           Презиме: \(surename)
                           Пол: \(jmbgInfo.gender.rawValue)
                           Датум рођења: \(jmbgInfo.dateOfBirth)
                           Регион: \(jmbgInfo.region.name), \(jmbgInfo.region.city)
                           """
                        AlertUtil.displayAlert(withTitle: "Успешна регистрација", message: successMessage, viewController: self)
                    }
                }
            }
        }
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        let keyboardHeight = keyboardFrame.height
        self.view.frame.origin.y = -keyboardHeight
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        self.view.frame.origin.y = 0
    }
    
    func showAlert(message: String) {
        print("Validation Failed: \(message)")
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
