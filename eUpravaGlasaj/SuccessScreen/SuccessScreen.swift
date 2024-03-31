import UIKit

class SuccessScreen: UIView {
    
    lazy var logoutButton: UIButton = {
        let view = UIButton()
        view.accessibilityIdentifier = "logoutButton"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.setImage(UIImage(named: "logoutButton"), for: .normal)
        return view
    }()
    
    
    lazy var successLabel: UILabel = {
        let view = UILabel()
        view.text = "Успешно сте послали свој глас!"
        view.textAlignment = .center
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var successImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "successImg")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        styleView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        styleView()
    }
    
    // MARK: - Setup and Styling
    
    private func setupView() {
        addSubview(logoutButton)
        addSubview(successLabel)
        addSubview(successImg)
        
        logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logoutButton.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        
        successLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        successLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        successLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        successLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        successImg.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 20).isActive = true
        successImg.heightAnchor.constraint(equalToConstant: 70).isActive = true
        successImg.widthAnchor.constraint(equalToConstant: 70).isActive = true
        successImg.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
       
    }
    
    private func styleView() {
        backgroundColor = UIColor(hex: 0xEAEAEA)
  
        successLabel.textColor = UIColor(hex: 0x253965)
        successLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 40.0)
        
        
    }
    

}
