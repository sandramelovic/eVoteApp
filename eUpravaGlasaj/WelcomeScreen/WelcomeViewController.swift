//
//  WelcomeViewController.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 8.3.24..
//

import UIKit

class WelcomeViewController: UIViewController {
    
    internal let welcomeView = WelcomeScreen()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let welcomeButton = welcomeView.startButton
        
        welcomeButton.addTarget(self, action: #selector(startButtonTapped(_:)), for: .touchUpInside)
        
    }
    
    override func loadView() {
        view = welcomeView  
    }
    
    @objc func startButtonTapped(_ sender: UIButton) {
        
        let identityViewController = IdentityViewController()
        
        navigationController?.pushViewController(identityViewController, animated: true)
    }
    
}
