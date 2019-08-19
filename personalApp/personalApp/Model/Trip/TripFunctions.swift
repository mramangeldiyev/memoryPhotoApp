//
//  TripFunctions.swift
//  personalApp
//
//  Created by nury on 5.08.2019.
//  Copyright © 2019 nury. All rights reserved.
//

import UIKit

class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
    }
    
    static func readTrips(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Add photo"))
            }
        }
        DispatchQueue.main.async {
            completion()
        }
        
    }
    
    static func updateTrip(at index: Int, title: String, image: UIImage? = nil){
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
    
    static func deleteTrip(index: Int){
        Data.tripModels.remove(at: index)
    }
    
}
