//
//  ProductDetailsViewCell.swift
//  Hitch
//
//  Created by apple on 20/01/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Cosmos

protocol ProductDetailsViewCellDelegate:NSObjectProtocol {
    func actioncallbackHide()
}
class ProductDetailsViewCell: BaseTableViewCell {
    var delegate:ProductDetailsViewCellDelegate?
    
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeDetailsLabel: UILabel!
    @IBOutlet weak var otherDetailsLabel1: UILabel?
    @IBOutlet weak var otherDetailsLabel2
    : UILabel?
     @IBOutlet weak var btnCamparison: UIButton?
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnComparison(sender: UIButton) {
          if let del = self.delegate {
              del.actioncallbackHide()
              btnCamparison?.isHidden = true
              
          }
       }
    

}
