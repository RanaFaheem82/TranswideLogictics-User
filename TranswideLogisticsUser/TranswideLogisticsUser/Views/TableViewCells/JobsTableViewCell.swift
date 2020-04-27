//
//  JobsTableViewCell.swift
//  TranswideLogisticsUser
//
//  Created by apple on 4/27/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class JobsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPickupLocation: UILabel!
    @IBOutlet weak var imgVehicle: UIImageView!
    @IBOutlet weak var lblDestination: UILabel!
    @IBOutlet weak var lblSource: UILabel!
    @IBOutlet weak var lblCost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
