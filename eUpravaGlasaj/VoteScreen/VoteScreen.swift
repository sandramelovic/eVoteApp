//
//  VoteScreen.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 11.3.24..
//

import UIKit

class VoteScreen: UIView {
    
    var voteSteps: VoteSteps?
    
    lazy var steps: VoteSteps = {
        let view = VoteSteps()
        view.accessibilityIdentifier = "steps"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var candidateTableView:  UITableView = {
        var view = UITableView()
        view.register(CandidateTableViewCell.self, forCellReuseIdentifier: Constants.candidateTableViewCell)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var voteButton: UIButton = {
        let view = UIButton()
        view.setTitle("Гласај", for: .normal)
        view.accessibilityIdentifier = "voteButton"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
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
        addSubview(steps)
        voteSteps = steps
        addSubview(candidateTableView)
        addSubview(voteButton)
        
        steps.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        steps.heightAnchor.constraint(equalToConstant: 80).isActive = true
        steps.widthAnchor.constraint(equalToConstant: 500).isActive = true
        steps.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        candidateTableView.topAnchor.constraint(equalTo: steps.bottomAnchor, constant: 170).isActive = true
        candidateTableView.bottomAnchor.constraint(equalTo: voteButton.topAnchor, constant: -25).isActive = true
        candidateTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        candidateTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        
        voteButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        voteButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        voteButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        voteButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -80).isActive = true
        
    }
    
    func styleView(){
        
        self.backgroundColor = UIColor(hex: 0xEAEAEA)
        
        candidateTableView.backgroundColor = .clear
        candidateTableView.separatorStyle = .none
        candidateTableView.insetsContentViewsToSafeArea = false
        candidateTableView.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 20).cgPath

        
        voteButton.backgroundColor = UIColor(hex: 0x253965)
        voteButton.layer.cornerRadius = 20
        voteButton.layer.borderWidth = 1
        voteButton.setTitleColor(UIColor.white, for: .normal)
        voteButton.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 25.0)
        
    }
    
    
}
