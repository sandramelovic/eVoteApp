//
//  VoteScreen.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 11.3.24..
//

import UIKit

class AdminScreen: UIView {
    
    lazy var logoutButton: UIButton = {
        let view = UIButton()
        view.accessibilityIdentifier = "logoutButton"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.setImage(UIImage(named: "logoutButton"), for: .normal)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Гласови"
        view.textAlignment = .center
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var adminTableView:  UITableView = {
        var view = UITableView()
        view.register(AdminTableViewCell.self, forCellReuseIdentifier: Constants.adminTableViewCell)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        styleView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(logoutButton)
        addSubview(titleLabel)
        addSubview(adminTableView)
        
        logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logoutButton.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
                
        adminTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        adminTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70).isActive = true
        adminTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        adminTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        
    }
    
    func styleView(){
        
        self.backgroundColor = UIColor(hex: 0xEAEAEA)
        
        titleLabel.textColor = UIColor(hex: 0x253965)
        titleLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 40.0)
        
        adminTableView.separatorStyle = .none
  
        adminTableView.backgroundColor = UIColor.white
        adminTableView.layer.cornerRadius = 15
        adminTableView.layer.borderWidth = 2
        
    }
    
    
}
