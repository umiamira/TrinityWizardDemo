//
//  DetailsViewController.swift
//  TrinityWizardDemo
//
//  Created by Umi Amira on 22/03/2024.
//

import UIKit

class DetailsViewController: UIViewController {

    var avenger: Avengers?
    
    var storedRating: Int = 0
    
    @IBOutlet weak var stackview_rating: UIStackView!
    @IBOutlet weak var lbl_desc: UILabel!
    @IBOutlet weak var image_view: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let avenger = avenger {
            image_view.image = UIImage(named: avenger.imageName)
            self.title = avenger.name
            lbl_desc.text = avenger.description

            // Set star images based on rating
            storedRating = avenger.rating
            updateRatingButtons()
            
            // Add tap gesture recognizer to each star image view
            for case let starImageView as UIImageView in stackview_rating.arrangedSubviews {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(rateButtonPressed(_:)))
                starImageView.isUserInteractionEnabled = true
                starImageView.addGestureRecognizer(tapGesture)
            }
            
        }
    }
    
    func updateRatingButtons() {
        for (index, subview) in stackview_rating.arrangedSubviews.enumerated() {
            guard let starImageView = subview as? UIImageView else {
                continue
            }
            if index < storedRating {
                starImageView.image = UIImage(named: "star_filled")
            } else {
                starImageView.image = UIImage(named: "star")
            }
        }
    }
    
    @objc func rateButtonPressed(_ sender: UITapGestureRecognizer) {
        guard let avenger = avenger else {
            return
        }
        
        if let starImageView = sender.view as? UIImageView,
           let index = stackview_rating.arrangedSubviews.firstIndex(of: starImageView) {
            storedRating = index + 1
            
            // Update rating buttons
            updateRatingButtons()
            
            
            // Store rating permanently
            updateAvengerRatingInUserDefaults(avengerID: avenger.id, newRating: storedRating)
//            UserDefaults.standard.set(storedRating, forKey: avengerRatingKey)
        }
    }
    
    

}
