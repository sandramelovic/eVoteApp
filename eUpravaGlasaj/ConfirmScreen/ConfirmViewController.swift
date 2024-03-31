//
//  ConfirmViewController.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 11.3.24..
//

import UIKit
import Parse

class ConfirmViewController: UIViewController {
    
    internal let confirmView = ConfirmScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = confirmView.voteSteps?.backButton
        let step3 = confirmView.voteSteps?.step3
        let identificationLabel = confirmView.voteSteps?.identificationLabel
        let logoutButton = confirmView.voteSteps?.logoutButton
        let confirmButton = confirmView.confirmButton
        let votingPaperImg = confirmView.votingPaperImg
        
        step3?.backgroundColor = UIColor(hex: 0x085b9e)
        identificationLabel?.text = "Корак 3: Потврди"

        backButton?.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        
        logoutButton?.addTarget(self, action: #selector(logoutButtonTapped(_:)), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped(_:)), for: .touchUpInside)
        
        
        
    }
    
    override func loadView() {
        view = confirmView
    }

    @objc func backButtonTapped(_ sender:UIButton) {
           navigationController?.popViewController(animated: true)
        }
    
    @objc func logoutButtonTapped(_ sender: UIButton) {
        
        let welcomeViewController = WelcomeViewController()
            PFUser.logOut()
        navigationController?.pushViewController(welcomeViewController, animated: true)

        }
    
    @objc func confirmButtonTapped(_ sender: UIButton){
        UIView.animate(withDuration: 0.5, animations: {
                self.confirmView.votingPaperImg.transform = CGAffineTransform(translationX: 0, y: 80)
            }) { (_) in
                
                if let currentUser = PFUser.current() {
                    if let username = currentUser.username {
                        let candidateName = self.confirmView.candidateLabel.text
                        UserDefaults.standard.set(candidateName, forKey: username)
                        let successViewController = SuccessViewController()
                        self.navigationController?.pushViewController(successViewController, animated: true)
                    } else {
                        print("Username not found.")
                    }
                } else {
                    print("No user logged in.")
                }
                
                
            }
    }
}
