//
//  StatusViewController.swift
//  cloneChatScreenWhatsapp
//
//  Created by Student on 08/04/22.
//

import Foundation
import UIKit

class StatusViewController: UIViewController {
    
    
    // MARK: - Private Variables
    
    private let titleScreen = "Status"
    
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfig()
    }
    
    
    // MARK: - Private Methods
    
    private func viewConfig() {
        title = titleScreen
        view.backgroundColor = UIColor.defaultBackgroundColor
    }
}
