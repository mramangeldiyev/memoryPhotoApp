//
//  TripsViewController.swift
//  personalApp
//
//  Created by nury on 5.08.2019.
//  Copyright © 2019 nury. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var tripEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips(completion: { [weak self] in
            self?.tableView.reloadData()
        })
        
        view.backgroundColor = Theme.Arka
        addButton.createFloatingActionButton()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let pp = segue.destination as! AddTripViewController
            pp.tripEdit = self.tripEdit
            pp.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}

extension TripsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
        
        
        
        cell.setup(tripModel:  Data.tripModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let trip = Data.tripModels[indexPath.row]
        
        let remove = UIContextualAction(style: .destructive, title: "remove") { (contextualAction, view, actionPerformed: @escaping (Bool) ->()) in
            TripFunctions.deleteTrip(index: indexPath.row)
            
            let alert = UIAlertController(title: "Remove it", message: "r u sure u want to remove: \(trip.title)?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "remove", style: .destructive, handler: { (alertAction) in
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            
            self.present(alert, animated: true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [remove])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "edit") { (contextualAction, view, actionPerformed: (Bool) -> ()) in
            self.tripEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            actionPerformed(true)
        }
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
}
