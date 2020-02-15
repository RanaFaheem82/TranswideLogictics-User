//
//  NewArrivalsCollectionViewCell.swift
//  Hitch
//
//  Created by apple on 10/25/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class HomeSliderCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var imgNewArrival: UIImageView!
    @IBOutlet weak var lblNewArrivalDisplaySize: UILabel!
    @IBOutlet weak var lblNewArrivalName: UILabel!
    @IBOutlet weak var lblNewArrivalPrice: UILabel!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureView(product:ProductViewModel)  {
        self.setImageWithUrl(imageView: self.imgNewArrival, url: product.productURL)
        self.lblNewArrivalPrice.text = product.price
        self.lblNewArrivalName.text = product.name
        
        
    }
    
    
}
