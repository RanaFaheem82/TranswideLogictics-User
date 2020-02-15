//
//  NewArrivalsCollectionViewCell.swift
//  Hitch
//
//  Created by apple on 10/28/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class NewArrivalsCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var imgNewArrival: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func configureView(product:ProductViewModel)  {
        self.setImageWithUrl(imageView: self.imgNewArrival, url: product.productURL)
    }
}
