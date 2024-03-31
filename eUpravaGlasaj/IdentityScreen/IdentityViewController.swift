//
//  IdentityViewController.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 11.3.24..
//

import UIKit
import Parse

class IdentityViewController: UIViewController {
    
    internal let identityView = IdentityScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = identityView.loginButton
        let registrationButton = identityView.registrationButton
        let backButton = identityView.voteSteps?.backButton
        let step1 = identityView.voteSteps?.step1
        let logoutButton = identityView.voteSteps?.logoutButton
        
        step1?.backgroundColor = UIColor(hex: 0x085b9e)
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
        
        backButton?.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        
        registrationButton.addTarget(self, action: #selector(registrationButtonTapped(_:)), for: .touchUpInside)
        
        logoutButton?.isHidden = true
        
        
    }
    
    override func loadView() {
        view = identityView
    }
    
    @objc func registrationButtonTapped(_ sender:UIButton){
        
        let registrationViewController = RegistrationViewController()
        
        navigationController?.pushViewController(registrationViewController, animated: true)
    }
    
    @objc func backButtonTapped(_ sender:UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func loginButtonTapped(_ sender:UIButton){
                
        PFUser.logInWithUsername(inBackground: self.identityView.usernameLoginTextField.text!, password: self.identityView.passwordLoginTextField.text!) {
            (user: PFUser?, error: Error?) -> Void in
            if user != nil {

                if UserDefaults.standard.string(forKey: (user?.username)!) != nil {
                    let successViewController = SuccessViewController()
                    self.navigationController?.pushViewController(successViewController, animated: true)
                } else {
                    let voteViewController = VoteViewController()
                    self.navigationController?.pushViewController(voteViewController, animated: true)
                }
                AlertUtil.displayAlert(withTitle: "Пријава успешна", message: "", viewController: self)
                
            } else {
                AlertUtil.displayAlert(withTitle: "Грешка", message: error!.localizedDescription, viewController: self)
            }
            
        }
        
    }
    
}
