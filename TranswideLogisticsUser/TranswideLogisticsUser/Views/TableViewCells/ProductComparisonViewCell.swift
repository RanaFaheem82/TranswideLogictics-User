//
//  ProductComparisonViewCell.swift
//  Hitch
//
//  Created by apple on 20/01/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ProductComparisonViewCell: UITableViewCell {
    
    @IBOutlet weak var companyImage: UIImageView!
      @IBOutlet weak var linkLabel: UILabel!
      @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceDetailsLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
