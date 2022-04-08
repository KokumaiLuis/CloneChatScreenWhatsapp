//
//  UIView+Extension.swift
//  cloneChatScreenWhatsapp
//
//  Created by Student on 08/04/22.
//

import Foundation
import UIKit

extension UIView {
    public func addSubViews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}

