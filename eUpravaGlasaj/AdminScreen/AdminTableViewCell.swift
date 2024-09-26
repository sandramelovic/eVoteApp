import UIKit

class AdminTableViewCell: UITableViewCell {
    
    lazy var candidateLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var groupLabel: UILabel = {
        var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var votesContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(hex: 0xEAEAEA)
        return view
    }()
    
    lazy var votes: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        return view
    }()
    
    lazy var separatorLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
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
        votes.text = nil
    }
    
    private func setupView() {
        addSubview(candidateLabel)
        addSubview(groupLabel)
        addSubview(votesContainerView)
        votesContainerView.addSubview(votes)
        addSubview(separatorLine)
        
        NSLayoutConstraint.activate([
            candidateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            candidateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            candidateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            groupLabel.topAnchor.constraint(equalTo: candidateLabel.bottomAnchor, constant: 5),
            groupLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            groupLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            groupLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            votesContainerView.topAnchor.constraint(equalTo: candidateLabel.topAnchor),
            votesContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            votesContainerView.widthAnchor.constraint(equalToConstant: 40),
            votesContainerView.heightAnchor.constraint(equalToConstant: 40),
            
            votes.centerXAnchor.constraint(equalTo: votesContainerView.centerXAnchor),
            votes.centerYAnchor.constraint(equalTo: votesContainerView.centerYAnchor),
            
            separatorLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            separatorLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            separatorLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 1)
            
        ])
    }
    
    private func styleView() {
        candidateLabel.textColor = .black
        candidateLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 15.0)
        
        groupLabel.textColor = UIColor.black.withAlphaComponent(0.7)
        groupLabel.font = UIFont(name: "AmericanTypewriter", size: 12.0)
        
        votes.textColor = UIColor(hex: 0x253965)
        votes.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
    }
}
