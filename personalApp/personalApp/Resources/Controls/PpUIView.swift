//
//  PpUIView.swift
//  personalApp
//
//  Created by nury on 6.08.2019.
//  Copyright © 2019 nury. All rights reserved.
//

import UIKit

class PpUIView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        
        backgroundColor = Theme.Arka
    }

}
