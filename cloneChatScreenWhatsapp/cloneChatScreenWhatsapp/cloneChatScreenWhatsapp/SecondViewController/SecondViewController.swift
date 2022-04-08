//
//  SecondViewController.swift
//  cloneChatScreenWhatsapp
//
//  Created by Student on 08/04/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Public Variables
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.tintColor = UIColor.defaultBackgroundColor
        button.addTarget(self, action: #selector(closeSecondViewController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func closeSecondViewController() {
        dismiss(animated: true) {
            print("Dismiss")
        }
    }
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfig()
        addSubViews()
        closeButtonConfig()

    }
    
    // MARK: - Private Methods
    
    private func viewConfig() {
        view.backgroundColor = UIColor.defaultBackgroundColor
    }
    
    private func addSubViews() {
        view.addSubview(closeButton)
    }
    
    private func closeButtonConfig() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    

}

