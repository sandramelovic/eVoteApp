import UIKit
import Parse
import web3swift

class SuccessViewController: UIViewController {
    
    let successView = SuccessScreen()
    var blockchain = Blockchain() // Assuming you have a Blockchain class
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoutButton = successView.logoutButton
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped(_:)), for: .touchUpInside)
        
        guard let currentUser = PFUser.current() else {
            // Handle error, user not found
            return
        }
        
        let username = currentUser.username ?? ""
        
        let name = currentUser["name"] as? String ?? ""
        let surename = currentUser["surename"] as? String ?? ""
        let gender = currentUser["gender"] as? String ?? ""
        let dateOfBirth = currentUser["dateOfBirth"] as? String ?? ""
        let regionName = currentUser["regionName"] as? String ?? ""
        let regionCity = currentUser["regionCity"] as? String ?? ""
        let vote = currentUser["vote"] as? String ?? ""

        // Retrieve the vote from the blockchain
//        if let vote = getVoteFromBlockchain(for: username) {
//            successView.userVoteLabel.text = vote
//        } else {
//            successView.userVoteLabel.text = "Vote not found"
//        }
        
        successView.userNameLabel.text = name
        successView.userSurenameLabel.text = surename
        successView.userGenderLabel.text = gender
        successView.userRegionLabel.text = regionName
        successView.userCityLabel.text = regionCity
        successView.userDateOfBirthLabel.text = dateOfBirth
        successView.userVoteLabel.text = vote
        
        performAnimation()
    }
    
    override func loadView() {
        view = successView
    }
    
    @objc func logoutButtonTapped(_ sender: UIButton) {
        let welcomeViewController = WelcomeViewController()
        PFUser.logOut()
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    private func performAnimation() {
        UIView.animate(withDuration: 3.0, animations: {
            self.successView.successLabel.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).translatedBy(x: 0, y: -200)
            self.successView.successImg.transform = CGAffineTransform(scaleX: 0.7, y: 0.7).translatedBy(x: 0, y: -250)
        }) { _ in
            UIView.animate(withDuration: 1.0, animations: {
                self.successView.nameLabel.alpha = 1.0
                self.successView.userNameLabel.alpha = 1.0
                self.successView.surenameLabel.alpha = 1.0
                self.successView.userSurenameLabel.alpha = 1.0
                self.successView.genderLabel.alpha = 1.0
                self.successView.userGenderLabel.alpha = 1.0
                self.successView.dateOfBirthLabel.alpha = 1.0
                self.successView.userDateOfBirthLabel.alpha = 1.0
                self.successView.cityLabel.alpha = 1.0
                self.successView.userCityLabel.alpha = 1.0
                self.successView.regionLabel.alpha = 1.0
                self.successView.userRegionLabel.alpha = 1.0
                self.successView.voteLabel.alpha = 1.0
                self.successView.userVoteLabel.alpha = 1.0
            })
        }
    }
    
    // Custom function to retrieve vote from the blockchain
    private func getVoteFromBlockchain(for username: String) -> String? {
        
        for block in blockchain.chain {
            for transaction in block.transactions {
                // Split the transaction into username and vote
                let components = transaction.split(separator: ":")
                if components.count == 2 {
                    let storedUsername = String(components[0])
                    let vote = String(components[1])
                    
                    if storedUsername == username {
                        return vote
                    }
                }
            }
        }
        return nil
    }
}
