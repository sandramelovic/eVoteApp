//
//  CandidateTableViewCell.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 17.3.24..
//

import UIKit

class CandidateTableViewCell: UITableViewCell {
    
    var radioButtonTapped: (() -> Void)?

    lazy var candidateLabel: UILabel = {
           var view = UILabel()
           view.text = "Rio de Janeiro"
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       
       lazy var groupLabel: UILabel = {
           var view = UILabel()
           view.text = "BRA"
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       
       lazy var candidateDetailView: UIView = {
           var view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()

       lazy var candidateDetailButton: UIButton = {
           var view = UIButton()
           view.setTitle("Више детаља", for: .normal)
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       
       lazy var candidateDetailLabelIcon: UIImageView = {
           var view = UIImageView()
           view.image = UIImage(named: "info")
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    
    lazy var radioButton: UIButton = {
            var view = UIButton(type: .custom)
        view.setImage(UIImage(named: "radiobutton_unchecked"), for: .normal)
        view.setImage(UIImage(named: "radiobutton_checked"), for: .selected)
        view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
       

       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupView()
           styleView()
           
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func prepareForReuse() {
           super.prepareForReuse()
           groupLabel.text = nil
           candidateLabel.text = nil
       }
           
       private func setupView() {
                   
           addSubview(candidateLabel)
           addSubview(groupLabel)
           addSubview(candidateDetailButton)
           addSubview(candidateDetailView)
           candidateDetailView.addSubview(candidateDetailButton)
           candidateDetailView.addSubview(candidateDetailLabelIcon)
           addSubview(radioButton)
           
           candidateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
           candidateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
           candidateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
           candidateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150).isActive = true
           
           groupLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
           groupLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
           groupLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
           groupLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150).isActive = true
           
           candidateDetailView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
           candidateDetailView.topAnchor.constraint(equalTo: topAnchor, constant: 55).isActive = true
           candidateDetailView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 200).isActive = true
           candidateDetailView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

           candidateDetailButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
           candidateDetailButton.topAnchor.constraint(equalTo: topAnchor, constant: 55).isActive = true
           candidateDetailButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 215).isActive = true
           candidateDetailButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35).isActive = true
           
           candidateDetailLabelIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11).isActive = true
           candidateDetailLabelIcon.leadingAnchor.constraint(equalTo: candidateDetailButton.trailingAnchor, constant: -5).isActive = true
           candidateDetailLabelIcon.widthAnchor.constraint(equalToConstant: 15).isActive = true
           candidateDetailLabelIcon.heightAnchor.constraint(equalToConstant: 15).isActive = true
           
           radioButton.bottomAnchor.constraint(equalTo: candidateDetailButton.topAnchor, constant: -5).isActive = true
           radioButton.leadingAnchor.constraint(equalTo: groupLabel.trailingAnchor, constant: 50).isActive = true
           radioButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
           radioButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
           }
       
       private func styleView() {
           self.backgroundColor = UIColor.white
           self.layer.cornerRadius = 24
           self.layer.borderWidth = 2
           
           candidateLabel.textColor = .black
           candidateLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 18.0)
           
           groupLabel.textColor = UIColor.black.withAlphaComponent(0.7)
           groupLabel.font = UIFont(name: "AmericanTypewriter", size: 15.0)


           candidateDetailButton.setTitleColor(UIColor(hex: 0x253965), for: .normal)
           candidateDetailButton.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 12.0)

       }


}
