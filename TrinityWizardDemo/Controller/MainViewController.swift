//
//  ViewController.swift
//  TrinityWizardDemo
//
//  Created by Umi Amira on 22/03/2024.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table_view: UITableView!
    
    var avengers: [Avengers] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndexPath = table_view.indexPathForSelectedRow {
            table_view.deselectRow(at: selectedIndexPath, animated: true)
        }
        
        refreshData()
    }
    
    func refreshData() {
        // Retrieving Avengers array from UserDefaults
        self.avengers = loadAvengersFromUserDefaults()
        table_view.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Avengers"
        
        //assuming we store all avengers data in userdefaults
        let dummy_avengers: [Avengers] = [
            Avengers(id: 1, imageName: "ironman", name: "Iron Man", description: "Genius, billionaire, playboy, philanthropist.", rating: 3),
            Avengers(id: 2, imageName: "hulk", name: "Hulk", description: "Always angry.", rating: 2),
            Avengers(id: 3, imageName: "superman", name: "Superman", description: "Superman in not in Avengers. But let him join the club.", rating: 0),
        ]
        saveAvengersToUserDefaults(avengers: dummy_avengers)
        
        refreshData()
        
        table_view.delegate = self
        table_view.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return avengers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        
        let avenger = avengers[indexPath.row]
        
        cell.image_view.image = UIImage(named: avenger.imageName)
        cell.image_view.layer.cornerRadius = cell.image_view.frame.size.width / 2
        cell.image_view.clipsToBounds = true
    
        cell.lbl_title.text = avenger.name
        
        // Set rating text based on star count
        switch avenger.rating {
        case 1:
            cell.lbl_rating.text = "Rating: Normal"
        case 2:
            cell.lbl_rating.text = "Rating: Very Good"
        case 3:
            cell.lbl_rating.text = "Rating: Awesome"
        default:
            cell.lbl_rating.text = "Rating: Not rated"
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let avenger = avengers[indexPath.row]
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {
                return
            }
            vc.avenger = avenger
            navigationController?.pushViewController(vc, animated: true)
        
    }
    


}

