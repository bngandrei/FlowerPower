//
//  FlowerOrderTableViewCell.swift
//  FlowerPower
//
//  Created by Andrei Bungiu on 24/06/2018.
//  Copyright © 2018 Andrei Bungiu. All rights reserved.
//

import UIKit

class FlowerOrderTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var flowerImg: UIImageView!
    @IBOutlet weak var deliverToNameLabel: UILabel!
    
}
