//
//  TabBarViewController.swift
//  cloneChatScreenWhatsapp
//
//  Created by Student on 08/04/22.
//

import Foundation
import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.defaultBackgroundColor
        tabBar.backgroundColor = UIColor.defaultBackgroundColor
        tabBar.tintColor = UIColor.defatultSecondaryColor
        setupViewControllers()
    }
    
    private func tabBarNavController(for rootViewController: UIViewController, title: String,
                                     navigationTitle: String,
                                     image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = navigationTitle
        return navController
    }
    
    func setupViewControllers() {
          viewControllers = [
              tabBarNavController(for: StatusViewController(), title: "Status", navigationTitle: "Status", image: UIImage(systemName: "circle.dashed.inset.filled")!),
              tabBarNavController(for: CallsViewController(), title: "Calls", navigationTitle: "Calls", image: UIImage(systemName: "phone.fill")!),
              tabBarNavController(for: CameraViewController(), title: "Camera", navigationTitle: "Camera", image: UIImage(systemName: "camera.fill")!),
              tabBarNavController(for: ChatsViewController(), title: "Chats", navigationTitle: "Conversas", image: UIImage(systemName: "message.fill")!),
              tabBarNavController(for: SettingsViewController(), title: "Settings", navigationTitle: "Settings", image: UIImage(systemName: "gear")!)
          ]
      }
}

