//
//  CandidateDetailViewController.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 20.3.24..
//

import UIKit

class CandidateDetailViewController: UIViewController {

    let candidateDetailView = CandidateDetailScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = candidateDetailView.backButton
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)


    }
    
    override func loadView() {
        view = candidateDetailView
    }
    

    @objc func backButtonTapped(_ sender:UIButton) {
           navigationController?.popViewController(animated: true)
        }

}
