//
//  friendCell.swift
//  NIBMConnect
//
//  Created by Akila Dilshan on 5/22/19.
//  Copyright © 2019 Sahan Jayawardhana. All rights reserved.
//

import UIKit

class friendCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var pfIMage: UIImageView!
    @IBOutlet weak var lastName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
