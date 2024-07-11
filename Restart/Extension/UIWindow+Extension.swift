//
//  UIWindow+Extension.swift
//  Restart
//
//  Created by Md Faizul karim on 11/7/24.
//

import SwiftUI

extension UIWindow {
    
    static var current: UIWindow? {
        
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}
