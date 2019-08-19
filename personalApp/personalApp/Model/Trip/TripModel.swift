//
//  TripModel.swift
//  personalApp
//
//  Created by nury on 5.08.2019.
//  Copyright © 2019 nury. All rights reserved.
//

import UIKit

class TripModel {
    var id: UUID 
    var title: String
    var image: UIImage?

    init(title: String, image: UIImage? = nil){
        id = UUID()
        self.title = title
        self.image = image
    }
}
