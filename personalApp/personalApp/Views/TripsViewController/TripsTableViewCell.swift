//
//  TripsTableViewCell.swift
//  personalApp
//
//  Created by nury on 5.08.2019.
//  Copyright © 2019 nury. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.mainFontNam, size: 30)
        
    }
    
    func setup(tripModel: TripModel){
        titleLabel.text = tripModel.title
        tripImageView.image = tripModel.image
    }


}
