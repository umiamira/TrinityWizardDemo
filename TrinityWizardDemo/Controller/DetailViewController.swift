//
//  DetailViewController.swift
//  TrinityWizardDemo
//
//  Created by Umi Amira on 22/03/2024.
//

import UIKit

class DetailViewController: UIViewController {

    var avenger: Avengers?
    
    
    @IBOutlet weak var stackview_rating: UIStackView!
    @IBOutlet weak var lbl_desc: UILabel!
    @IBOutlet weak var image_view: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let avenger = avenger {
//            image_view.image = UIImage(named: avenger.imageName)
            self.title = avenger.name
//            lbl_desc.text = avenger.description
//            ratingLabel.text = "Rating: \(avenger.rating) stars"
        }
        
    }


}

