//
//  AddTrip ViewController.swift
//  personalApp
//
//  Created by nury on 6.08.2019.
//  Copyright © 2019 nury. All rights reserved.
//

import Photos
import UIKit

class AddTripViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelBut: UIButton!
    @IBOutlet weak var saveBut: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var doneSaving: (() ->())?
    var tripEdit: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont(name: Theme.mainFontNam, size: 22)
        
        if let index = tripEdit {
            let trip = Data.tripModels[index]
            tripTextField.text = trip.title
            imageView.image = trip.image
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        tripTextField.rightViewMode = .never
        
        guard tripTextField.text != "", let newTripName = tripTextField.text else {
            tripTextField.layer.borderColor = UIColor.red.cgColor
            tripTextField.layer.borderWidth = 2
            tripTextField.placeholder = "place insert the name"
            tripTextField.rightViewMode = .always
            return
        }
        
        if let index = tripEdit {
            TripFunctions.updateTrip(at: index, title: newTripName, image: imageView.image)
        } else {
            TripFunctions.createTrip(tripModel: TripModel(title: tripTextField.text!, image: imageView.image))
        }
        
        dismiss(animated: true)
        if let doneSaving = doneSaving {
            doneSaving()
        }
        
        
    }
    @IBAction func insertPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    let pickerController = UIImagePickerController()
                    pickerController.allowsEditing = true
                    pickerController.delegate = self
                    pickerController.sourceType = .photoLibrary
                    self.present(pickerController, animated: true)
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized {
                        let pickerController = UIImagePickerController()
                        pickerController.delegate = self
                        pickerController.sourceType = .photoLibrary
                        self.present(pickerController, animated: true)
                    }
                case .restricted:
                    let alert = UIAlertController(title: "Can't access library", message: "Can't access to photo library", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                case .denied:
                    let alert = UIAlertController(title: "Denied photo access", message: "Access to library is denied. Go to settings", preferredStyle: .alert)
                    let goSettingsAction = UIAlertAction(title: "go to settings", style: .default) { (action) in
                        DispatchQueue.main.async {
                            let url = URL(string: UIApplication.openSettingsURLString)!
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    alert.addAction(goSettingsAction)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true)
                }
                
            }
        }
    }
}


extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.imageView.image = image
        } else if let image = info[.originalImage] as? UIImage {
            self.imageView.image = image
        }
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}


