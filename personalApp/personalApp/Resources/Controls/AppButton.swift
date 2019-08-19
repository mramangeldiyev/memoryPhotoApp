//
//  AppButton.swift
//  personalApp
//
//  Created by nury on 6.08.2019.
//  Copyright © 2019 nury. All rights reserved.
//

import UIKit

class AppButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = Theme.Ton
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
    }

}
