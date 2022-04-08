//
//  CustomTableViewCell.swift
//  cloneChatScreenWhatsapp
//
//  Created by Student on 08/04/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Public Variables
    
    static let identifier = "CustomTableViewCell"
    
    lazy var contactImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var organizationalVerticalStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.spacing = 8
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var organizationalHorizontalStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var contactNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor.defaultTitleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contactChatLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.defaultTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lastMessageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.defaultTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - Life Cycles

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubViews()
        componentsConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Methods

    private func addSubViews(){
        addSubview(contactImageView)
        addSubview(organizationalVerticalStack)
        addSubview(organizationalHorizontalStack)
        organizationalHorizontalStack.addArrangedSubview(contactNameLabel)
        organizationalHorizontalStack.addArrangedSubview(lastMessageLabel)
        organizationalVerticalStack.addArrangedSubview(organizationalHorizontalStack)
        organizationalVerticalStack.addArrangedSubview(contactChatLabel)
    }
    
    private func componentsConfigure() {
        contactImageViewConfig()
        organizationalVerticalStackConfig()
        organizationalHorizontalStackConfig()
    }
    
    private func contactImageViewConfig() {
        contactImageView.layer.cornerRadius = contactImageView.layer.frame.width / 2
        
        NSLayoutConstraint.activate([
            
            contactImageView.heightAnchor.constraint(equalToConstant: 60),
            contactImageView.widthAnchor.constraint(equalToConstant: 60),
            contactImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            contactImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func organizationalVerticalStackConfig() {
        NSLayoutConstraint.activate([
            organizationalVerticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            organizationalVerticalStack.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            organizationalVerticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            organizationalVerticalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    private func organizationalHorizontalStackConfig() {
        NSLayoutConstraint.activate([
            organizationalHorizontalStack.leadingAnchor.constraint(equalTo: organizationalVerticalStack.leadingAnchor),
            organizationalHorizontalStack.trailingAnchor.constraint(equalTo: organizationalVerticalStack.trailingAnchor)
        ])
    }
    
    
    // MARK: - Public Methods
    
    public func setup(name: String, picture: String, lastChat: String, lastChatTimestamp: String) {
        
        contactImageView.loadImage(from: picture)
        contactNameLabel.text = name
        contactChatLabel.text = lastChat
        lastMessageLabel.text = lastChatTimestamp
        
        contactImageView.layer.cornerRadius = 30
        contactImageView.layer.masksToBounds = true
    }
    
}
