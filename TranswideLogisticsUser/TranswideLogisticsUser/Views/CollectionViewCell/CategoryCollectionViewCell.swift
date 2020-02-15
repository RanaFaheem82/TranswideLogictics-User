//
//  CategoryCollectionViewCell.swift
//  Hitch
//
//  Created by apple on 10/25/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var view: UIView?
    @IBOutlet weak var imgbackground: UIImageView!
    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var lblCategory: UILabel!
    
    @IBOutlet weak var imgTextbox: UIImageView!
    
    
    func configureView(cat: CategoryViewModel)  {
        self.setImageWithUrl(imageView: self.imgCategory, url: cat.catUrl)
        self.lblCategory.text = cat.name
        
    }
    
    
}


