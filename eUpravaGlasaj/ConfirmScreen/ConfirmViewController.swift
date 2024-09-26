import UIKit
import Parse

class ConfirmViewController: UIViewController {
    
    internal let confirmView = ConfirmScreen()
    var blockchain = Blockchain()
    
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
    
    @objc func confirmButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.confirmView.votingPaperImg.transform = CGAffineTransform(translationX: 0, y: 80)
        }) { (_) in
            if let currentUser = PFUser.current() {
                if let username = currentUser.username {
                    if let candidateName = self.confirmView.candidateLabel.text {
                        // Create a transaction in the format "username:candidateName"
                        let transaction = "\(username):\(candidateName)"
                        
                        // Save vote to blockchain
                        self.blockchain.addBlock(transactions: [transaction])
            
                        
                        currentUser["vote"] = candidateName
                        currentUser.saveInBackground { (success, error) in
                            if success {
                                // Successfully updated the vote status
                                let successViewController = SuccessViewController()
                                successViewController.blockchain = self.blockchain // Pass blockchain to success view controller
                                self.navigationController?.pushViewController(successViewController, animated: true)
                            } else if let error = error {
                                print("Error updating vote status: \(error.localizedDescription)")
                            }
                        }
                        
                    } else {
                        print("Candidate name is not set.")
                    }
                } else {
                    print("Username not found.")
                }
            } else {
                print("No user logged in.")
            }
        }
    }
}
