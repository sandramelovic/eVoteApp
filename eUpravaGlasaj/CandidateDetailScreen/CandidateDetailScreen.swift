//
//  CandidateDetailScreen.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 20.3.24..
//

import UIKit

class CandidateDetailScreen: UIView {
    
    lazy var backButton: UIButton = {
        let view = UIButton()
        view.accessibilityIdentifier = "backButton"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.setImage(UIImage(named: "backButton"), for: .normal)
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var listImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "list")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dateOfBirthImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "birthDate")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dateOfBirthLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var professionImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "professionImg")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var professionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contactImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "contactImg")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contactLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var groupImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "groupImg")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var groupLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var biographyImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "biographyImg")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var biographyLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var motiveImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "motiveImg")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var motiveLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        
        styleView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(backButton)
        addSubview(nameLabel)
        addSubview(listImg)
        addSubview(dateOfBirthImg)
        addSubview(dateOfBirthLabel)
        addSubview(professionImg)
        addSubview(professionLabel)
        addSubview(contactImg)
        addSubview(contactLabel)
        addSubview(groupImg)
        addSubview(groupLabel)
        addSubview(biographyImg)
        addSubview(biographyLabel)
        addSubview(motiveImg)
        addSubview(motiveLabel)
        
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        listImg.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        listImg.heightAnchor.constraint(equalToConstant: 200).isActive = true
        listImg.widthAnchor.constraint(equalToConstant: 200).isActive = true
        listImg.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        dateOfBirthLabel.topAnchor.constraint(equalTo: listImg.bottomAnchor, constant: 20).isActive = true
        dateOfBirthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        dateOfBirthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        dateOfBirthImg.topAnchor.constraint(equalTo: listImg.bottomAnchor, constant: 20).isActive = true
        dateOfBirthImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dateOfBirthImg.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dateOfBirthImg.trailingAnchor.constraint(equalTo: dateOfBirthLabel.leadingAnchor, constant: -10).isActive = true
        
        professionLabel.topAnchor.constraint(equalTo: dateOfBirthLabel.bottomAnchor, constant: 10).isActive = true
        professionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        professionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        professionImg.topAnchor.constraint(equalTo: dateOfBirthLabel.bottomAnchor, constant: 10).isActive = true
        professionImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        professionImg.widthAnchor.constraint(equalToConstant: 30).isActive = true
        professionImg.trailingAnchor.constraint(equalTo: professionLabel.leadingAnchor, constant: -10).isActive = true
        
        contactLabel.topAnchor.constraint(equalTo: professionLabel.bottomAnchor, constant: 10).isActive = true
        contactLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        contactLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        contactImg.topAnchor.constraint(equalTo: professionLabel.bottomAnchor, constant: 10).isActive = true
        contactImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        contactImg.widthAnchor.constraint(equalToConstant: 30).isActive = true
        contactImg.trailingAnchor.constraint(equalTo: contactLabel.leadingAnchor, constant: -10).isActive = true
        
        groupLabel.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 10).isActive = true
        groupLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        groupLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        groupImg.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 10).isActive = true
        groupImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        groupImg.widthAnchor.constraint(equalToConstant: 30).isActive = true
        groupImg.trailingAnchor.constraint(equalTo: groupLabel.leadingAnchor, constant: -10).isActive = true
        
        biographyLabel.topAnchor.constraint(equalTo: groupLabel.bottomAnchor, constant: 10).isActive = true
        biographyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        biographyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        biographyImg.topAnchor.constraint(equalTo: groupLabel.bottomAnchor, constant: 10).isActive = true
        biographyImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        biographyImg.widthAnchor.constraint(equalToConstant: 30).isActive = true
        biographyImg.trailingAnchor.constraint(equalTo: biographyLabel.leadingAnchor, constant: -10).isActive = true
        
        motiveLabel.topAnchor.constraint(equalTo: biographyLabel.bottomAnchor, constant: 10).isActive = true
        motiveLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40).isActive = true
        motiveLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        motiveLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        
        motiveImg.topAnchor.constraint(equalTo: biographyLabel.bottomAnchor, constant: 10).isActive = true
        motiveImg.heightAnchor.constraint(equalToConstant: 30).isActive = true
        motiveImg.widthAnchor.constraint(equalToConstant: 30).isActive = true
        motiveImg.trailingAnchor.constraint(equalTo: motiveLabel.leadingAnchor, constant: -10).isActive = true
    }
    
    func styleView(){
        
        self.backgroundColor = UIColor(hex: 0xEAEAEA)
        
        nameLabel.textColor = UIColor(hex: 0x253965)
        nameLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 55.0)
        
        dateOfBirthLabel.textColor = UIColor(hex: 0x253965)
        dateOfBirthLabel.font = UIFont(name: "AmericanTypewriter", size: 25.0)

        professionLabel.textColor = UIColor(hex: 0x253965)
        professionLabel.font = UIFont(name: "AmericanTypewriter", size: 25.0)

        contactLabel.textColor = UIColor(hex: 0x253965)
        contactLabel.font = UIFont(name: "AmericanTypewriter", size: 20.0)

        groupLabel.textColor = UIColor(hex: 0x253965)
        groupLabel.font = UIFont(name: "AmericanTypewriter", size: 20.0)

        biographyLabel.textColor = UIColor(hex: 0x253965)
        biographyLabel.font = UIFont(name: "AmericanTypewriter", size: 15.0)

        motiveLabel.textColor = UIColor(hex: 0x253965)
        motiveLabel.font = UIFont(name: "AmericanTypewriter", size: 15.0)

    }
}



