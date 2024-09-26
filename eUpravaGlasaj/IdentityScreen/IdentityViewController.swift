import UIKit
import Parse

class IdentityViewController: UIViewController {
    
    internal let identityView = IdentityScreen()
    
    private var keyboardHandler: KeyboardHandler?
    var blockchain = Blockchain() // Ensure blockchain instance is created
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = identityView.loginButton
        let registrationButton = identityView.registrationButton
        let backButton = identityView.voteSteps?.backButton
        let step1 = identityView.voteSteps?.step1
        let logoutButton = identityView.voteSteps?.logoutButton
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        step1?.backgroundColor = UIColor(hex: 0x085b9e)
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
        
        backButton?.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        
        registrationButton.addTarget(self, action: #selector(registrationButtonTapped(_:)), for: .touchUpInside)
        
        logoutButton?.isHidden = true
        
        keyboardHandler = KeyboardHandler(view: self.view)
        
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
                if let role = user?["role"] as? String, role == "admin" {
                    let adminViewController = AdminViewController()
                    self.navigationController?.pushViewController(adminViewController, animated: true)
                } else if let vote = user?["vote"] as? String, !vote.isEmpty {
                    // Find and display vote from blockchain
                    if let username = user?.username {
                        let voteDetails = self.findVoteInBlockchain(username: username)
                        let successViewController = SuccessViewController()
//                        successViewController.voteDetails = voteDetails // Pass vote details to success view controller
                        self.navigationController?.pushViewController(successViewController, animated: true)
                    } else {
                        print("Username not found.")
                    }
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
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Function to find vote in blockchain based on username
    private func findVoteInBlockchain(username: String) -> String {
        for block in blockchain.chain {
            for transaction in block.transactions {
                if transaction.starts(with: "\(username):") {
                    return transaction
                }
            }
        }
        return "Vote not found in blockchain"
    }
}
