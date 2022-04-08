//
//  CameraViewController.swift
//  cloneChatScreenWhatsapp
//
//  Created by Student on 08/04/22.
//

import Foundation
import UIKit

class CameraViewController: UIViewController {
    
    
    // MARK: - Private Variables
    
    private let titleScreen = "Camera"
    
    
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
