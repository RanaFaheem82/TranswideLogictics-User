//
//  OtherOptionsCollectionViewCell.swift
//  Hitch
//
//  Created by apple on 10/29/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class OtherOptionsCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var imgOtherOptions: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func configureView(product:ProductViewModel)  {
        self.setImageWithUrl(imageView: self.imgOtherOptions, url: product.productURL)
    }
    
}
