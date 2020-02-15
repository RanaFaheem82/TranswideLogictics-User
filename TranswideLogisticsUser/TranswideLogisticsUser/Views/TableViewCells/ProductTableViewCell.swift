//
//  ProductTableViewCell.swift
//  Hitch
//
//  Created by Rapidzz Macbook on 08/11/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

protocol ProductCellDelegate {
    func actionCallBackFavourite(product: ProductViewModel)
}

class ProductTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var lblPrice:UILabel?
    @IBOutlet weak var imgProduct:UIImageView?
    @IBOutlet weak var btnFavourite:UIButton?
    
    var product: ProductViewModel?
    var delegate: ProductCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureView(product: ProductViewModel) {
        self.product = product
        self.lblTitle?.text = product.name
        self.lblPrice?.text = product.price
        self.setImageWithUrl(imageView: self.imgProduct!, url: product.productURL, placeholder: "AppLogo")
        
        if(product.isFavourite){
            self.btnFavourite?.isSelected = false
        }else{
            self.btnFavourite?.isSelected = true
        }
        
    }
    
    @IBAction func actionFavourite(_ sender: UIButton){
        self.delegate?.actionCallBackFavourite(product: self.product!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
