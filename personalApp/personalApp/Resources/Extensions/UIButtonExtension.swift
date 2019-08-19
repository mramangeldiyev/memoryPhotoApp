//
//  UIButtonExtension.swift
//  personalApp
//
//  Created by nury on 6.08.2019.
//  Copyright © 2019 nury. All rights reserved.
//

import UIKit

extension UIButton {
    func createFloatingActionButton(){
        backgroundColor = Theme.Ton
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 3
    }
}
