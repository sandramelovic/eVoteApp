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
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.text = "Име:"
        view.accessibilityIdentifier = "text_name"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var userNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Sandra"
        view.accessibilityIdentifier = "text_userName"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var surenameLabel: UILabel = {
        let view = UILabel()
        view.text = "Презиме:"
        view.accessibilityIdentifier = "text_surename"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var userSurenameLabel: UILabel = {
        let view = UILabel()
        view.text = "Melovic"
        view.accessibilityIdentifier = "text_userSurename"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var genderLabel: UILabel = {
        let view = UILabel()
        view.text = "Пол:"
        view.accessibilityIdentifier = "text_gender"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var userGenderLabel: UILabel = {
        let view = UILabel()
        view.text = "Female"
        view.accessibilityIdentifier = "text_userGender"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var dateOfBirthLabel: UILabel = {
        let view = UILabel()
        view.text = "Датум рођења:"
        view.accessibilityIdentifier = "text_dateOfBirth"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var userDateOfBirthLabel: UILabel = {
        let view = UILabel()
        view.text = "25.10.2000."
        view.accessibilityIdentifier = "text_userDateOfBirth"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var regionLabel: UILabel = {
        let view = UILabel()
        view.text = "Регион:"
        view.accessibilityIdentifier = "text_region"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var userRegionLabel: UILabel = {
        let view = UILabel()
        view.text = "Srbija"
        view.accessibilityIdentifier = "text_userRegion"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var cityLabel: UILabel = {
        let view = UILabel()
        view.text = "Град:"
        view.accessibilityIdentifier = "text_city"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var userCityLabel: UILabel = {
        let view = UILabel()
        view.text = "Novi Sad"
        view.accessibilityIdentifier = "text_userCity"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var voteLabel: UILabel = {
        let view = UILabel()
        view.text = "Гласао/ла за:"
        view.accessibilityIdentifier = "voteLabel"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
        return view
    }()
    
    lazy var userVoteLabel: UILabel = {
        let view = UILabel()
        view.text = "Sandra Melovic"
        view.accessibilityIdentifier = "userVoteLabel"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.alpha = 0 // Start hidden
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
        addSubview(nameLabel)
        addSubview(userNameLabel)
        addSubview(surenameLabel)
        addSubview(userSurenameLabel)
        addSubview(genderLabel)
        addSubview(userGenderLabel)
        addSubview(dateOfBirthLabel)
        addSubview(userDateOfBirthLabel)
        addSubview(regionLabel)
        addSubview(userRegionLabel)
        addSubview(cityLabel)
        addSubview(userCityLabel)
        addSubview(voteLabel)
        addSubview(userVoteLabel)
        
        logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logoutButton.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        
        successLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        successLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100).isActive = true
        successLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        successLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        successImg.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 20).isActive = true
        successImg.heightAnchor.constraint(equalToConstant: 70).isActive = true
        successImg.widthAnchor.constraint(equalToConstant: 70).isActive = true
        successImg.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 350).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        userNameLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10).isActive = true
        
        surenameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        surenameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        userSurenameLabel.topAnchor.constraint(equalTo: surenameLabel.topAnchor).isActive = true
        userSurenameLabel.leadingAnchor.constraint(equalTo: surenameLabel.trailingAnchor, constant: 10).isActive = true
        
        genderLabel.topAnchor.constraint(equalTo: surenameLabel.bottomAnchor, constant: 10).isActive = true
        genderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
       
        userGenderLabel.topAnchor.constraint(equalTo: genderLabel.topAnchor).isActive = true
        userGenderLabel.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor, constant: 10).isActive = true
        
        dateOfBirthLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10).isActive = true
        dateOfBirthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
       
        userDateOfBirthLabel.topAnchor.constraint(equalTo: dateOfBirthLabel.topAnchor).isActive = true
        userDateOfBirthLabel.leadingAnchor.constraint(equalTo: dateOfBirthLabel.trailingAnchor, constant: 10).isActive = true
        
        regionLabel.topAnchor.constraint(equalTo: dateOfBirthLabel.bottomAnchor, constant: 10).isActive = true
        regionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
       
        userRegionLabel.topAnchor.constraint(equalTo: regionLabel.topAnchor).isActive = true
        userRegionLabel.leadingAnchor.constraint(equalTo: regionLabel.trailingAnchor, constant: 10).isActive = true
        
        cityLabel.topAnchor.constraint(equalTo: regionLabel.bottomAnchor, constant: 10).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        userCityLabel.topAnchor.constraint(equalTo: cityLabel.topAnchor).isActive = true
        userCityLabel.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 10).isActive = true
        
        voteLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10).isActive = true
        voteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        userVoteLabel.topAnchor.constraint(equalTo: voteLabel.topAnchor, constant: 40).isActive = true
        userVoteLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func styleView() {
        backgroundColor = UIColor(hex: 0xEAEAEA)
        successLabel.textColor = UIColor(hex: 0x253965)
        successLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 40.0)
        
        nameLabel.textColor = UIColor(hex: 0x253965)
        nameLabel.font = UIFont(name: "AmericanTypewriter", size: 25)
        
        userNameLabel.textColor = UIColor(hex: 0x253965)
        userNameLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        
        surenameLabel.textColor = UIColor(hex: 0x253965)
        surenameLabel.font = UIFont(name: "AmericanTypewriter", size: 25)
        
        userSurenameLabel.textColor = UIColor(hex: 0x253965)
        userSurenameLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        
        genderLabel.textColor = UIColor(hex: 0x253965)
        genderLabel.font = UIFont(name: "AmericanTypewriter", size: 25)
        
        userGenderLabel.textColor = UIColor(hex: 0x253965)
        userGenderLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        
        dateOfBirthLabel.textColor = UIColor(hex: 0x253965)
        dateOfBirthLabel.font = UIFont(name: "AmericanTypewriter", size: 25)
        
        userDateOfBirthLabel.textColor = UIColor(hex: 0x253965)
        userDateOfBirthLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        
        regionLabel.textColor = UIColor(hex: 0x253965)
        regionLabel.font = UIFont(name: "AmericanTypewriter", size: 25)
        
        userRegionLabel.textColor = UIColor(hex: 0x253965)
        userRegionLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        
        cityLabel.textColor = UIColor(hex: 0x253965)
        cityLabel.font = UIFont(name: "AmericanTypewriter", size: 25)
        
        userCityLabel.textColor = UIColor(hex: 0x253965)
        userCityLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        
        voteLabel.textColor = UIColor(hex: 0x253965)
        voteLabel.font = UIFont(name: "AmericanTypewriter", size: 25)
        
        userVoteLabel.textColor = UIColor(hex: 0x253965)
        userVoteLabel.font = UIFont(name: "Helvetica-Bold", size: 35)
        userVoteLabel.textColor = UIColor.red

    }
}
