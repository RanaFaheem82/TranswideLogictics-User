//
//  PriceHistoryTableViewCell.swift
//  Hitch
//
//  Created by apple on 10/30/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

protocol PriceHistoryCellDelegate {
    func actionCallBackOpenUrl()
}

class PriceHistoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var btnCompanylink: UIButton!
    @IBOutlet weak var lblPriceHistoryDate: UILabel!
    @IBOutlet weak var lblPriceHistory: UILabel!

    var delegate: PriceHistoryCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(history: PriceHistoryViewModel) {
        self.lblPriceHistoryDate.text = history.dateString
        self.lblPriceHistory.text = history.price
        if(history.isPriceChanged){
            self.lblPriceHistory.font = AppFonts.KhmerBold(size: 12)
            self.lblPriceHistoryDate.font = AppFonts.KhmerBold(size: 12)
        }else{
            self.lblPriceHistory.font = AppFonts.KhmerRegular(size: 12)
            self.lblPriceHistoryDate.font = AppFonts.KhmerRegular(size: 12)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionOpenUrl(_ sender: Any) {
        
        if let del = self.delegate{
            del.actionCallBackOpenUrl()
            
        }
        
    }
    
   
    
    
    
 
}
