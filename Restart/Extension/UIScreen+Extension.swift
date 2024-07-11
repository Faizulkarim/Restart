//
//  UIScreen+Extension.swift
//  Restart
//
//  Created by Md Faizul karim on 11/7/24.
//


import SwiftUI

extension UIScreen {
    
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
}
