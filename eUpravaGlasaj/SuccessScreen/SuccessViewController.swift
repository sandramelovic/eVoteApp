//
//  SuccessViewController.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 30.3.24..
//

import UIKit
import Parse

class SuccessViewController: UIViewController {
    
    let successView = SuccessScreen()

    override func viewDidLoad() {
        super.viewDidLoad()

        let logoutButton = successView.logoutButton
        
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped(_:)), for: .touchUpInside)

    }
    

    override func loadView() {
        view = successView
    }
    
    @objc func logoutButtonTapped(_ sender: UIButton) {
        
        let welcomeViewController = WelcomeViewController()
            PFUser.logOut()
        navigationController?.pushViewController(welcomeViewController, animated: true)

        }

}
