//
//  MainTableViewCell.swift
//  TrinityWizardDemo
//
//  Created by Umi Amira on 22/03/2024.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_rating: UILabel!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var image_view: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
