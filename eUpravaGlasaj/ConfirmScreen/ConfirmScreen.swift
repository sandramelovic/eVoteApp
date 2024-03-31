//
//  ConfirmScreen.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 11.3.24..
//

import UIKit

class ConfirmScreen: UIView {
    
    var voteSteps: VoteSteps?
    
    lazy var steps: VoteSteps = {
        let view = VoteSteps()
        view.accessibilityIdentifier = "steps"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var confirmLabel: UILabel = {
        let view = UILabel()
        view.text = "Да ли сте сигурни да желите да гласате за кандидата:"
        view.accessibilityIdentifier = "confirmLabel"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var candidateLabel: UILabel = {
        let view = UILabel()
        view.text = "Sandra Melovic"
        view.accessibilityIdentifier = "candidateLabel"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let attributedString = NSAttributedString(string: "Sandra Melovic", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
    
    lazy var votingPaperImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "votingPaper")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 1
        return view
    }()
    
    lazy var votingBoxImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "votingBox")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 0
        return view
    }()
    
    lazy var confirmButton: UIButton = {
        let view = UIButton()
        view.setTitle("Поштаљи глас", for: .normal)
        view.accessibilityIdentifier = "confirmButton"
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
        addSubview(confirmLabel)
        addSubview(candidateLabel)
        addSubview(votingPaperImg)
        addSubview(votingBoxImg)
        addSubview(confirmButton)
        
        steps.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        steps.heightAnchor.constraint(equalToConstant: 80).isActive = true
        steps.widthAnchor.constraint(equalToConstant: 500).isActive = true
        steps.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        confirmLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        confirmLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        confirmLabel.topAnchor.constraint(equalTo: steps.bottomAnchor, constant: 200).isActive = true
        
        candidateLabel.topAnchor.constraint(equalTo: confirmLabel.bottomAnchor, constant: 10).isActive = true
        candidateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        votingPaperImg.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        votingPaperImg.heightAnchor.constraint(equalToConstant: 100).isActive = true
        votingPaperImg.widthAnchor.constraint(equalToConstant: 100).isActive = true
        votingPaperImg.topAnchor.constraint(equalTo: candidateLabel.bottomAnchor, constant: 30).isActive = true
        
        votingBoxImg.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 15).isActive = true
        votingBoxImg.heightAnchor.constraint(equalToConstant: 170).isActive = true
        votingBoxImg.widthAnchor.constraint(equalToConstant: 170).isActive = true
        votingBoxImg.topAnchor.constraint(equalTo: votingPaperImg.bottomAnchor, constant: 40).isActive = true
        
        confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        confirmButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        confirmButton.topAnchor.constraint(equalTo: votingBoxImg.bottomAnchor, constant: 30).isActive = true
        
        
    }
    
    func styleView(){
        
        self.backgroundColor = UIColor(hex: 0xEAEAEA)
        
        confirmLabel.textColor = UIColor(hex: 0x253965)
        confirmLabel.font = UIFont(name: "AmericanTypewriter", size: 18.0)
        confirmLabel.numberOfLines = 0
        confirmLabel.lineBreakMode = .byWordWrapping
        confirmLabel.textAlignment = .center
        
        candidateLabel.textColor = UIColor(hex: 0x253965)
        candidateLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 18.0)
        candidateLabel.attributedText = attributedString
        
        confirmButton.backgroundColor = UIColor(hex: 0x253965)
        confirmButton.layer.cornerRadius = 20
        confirmButton.layer.borderWidth = 1
        confirmButton.setTitleColor(UIColor.white, for: .normal)
        confirmButton.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 22.0)
        
        
        
        
    }
    
    
}
