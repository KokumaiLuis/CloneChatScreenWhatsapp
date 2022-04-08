//
//  CustomTableViewHeader.swift
//  DesafioAula15_01
//
//  Created by student on 08/04/2022.
//

import UIKit

class CustomTableViewHeader: UITableViewHeaderFooterView {
    
    
    // MARK: - Public Variables

    static let identifier = "TaskTableViewHeader"
    
    lazy var broadcastsListButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle( "Broadcasts Lists", for: .normal)
        button.backgroundColor = UIColor.defaultBackgroundColor
        button.setTitleColor(UIColor.defatultSecondaryColor, for: .normal)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var newGroupButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle( "New Group", for: .normal)
        button.backgroundColor = UIColor.defaultBackgroundColor
        button.setTitleColor(UIColor.defatultSecondaryColor, for: .normal)
        button.contentHorizontalAlignment = .right
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // MARK: - Life Cycles
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentViewConfig()
        addSubViews()
        broadcastsListButtonConfig()
        newGroupButtonConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    
    private func contentViewConfig() {
        contentView.backgroundColor = .systemBackground
    }
    
    private func addSubViews() {
        contentView.addSubview(broadcastsListButton)
        contentView.addSubview(newGroupButton)
    }
    
    private func broadcastsListButtonConfig() {
        NSLayoutConstraint.activate([
            broadcastsListButton.widthAnchor.constraint(equalToConstant: 250),
            broadcastsListButton.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 2)
        ])
    }
    
    private func newGroupButtonConfig() {
        NSLayoutConstraint.activate([
            newGroupButton.widthAnchor.constraint(equalToConstant: 100),
            newGroupButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 2)
        ])
    }
    
}
