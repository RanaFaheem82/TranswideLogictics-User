//
//  SideMenuProfileTableViewCell.swift
//  WrestlerBlower
//
//  Created by Rapidzz Macbook on 08/10/2019.
//  Copyright © 2019 Rapidzz. All rights reserved.
//

import UIKit

class SideMenuProfileTableViewCell: BaseTableViewCell {
    
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewUserInfo: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(isLoggedin:Bool)  {
        if(isLoggedin){
            let user = Global.shared.user ?? UserViewModel()
            self.setImageWithUrl(imageView: self.imgProfile, url: user.profileImage, placeholder: PlaceHolders.appLogo)
            self.lblName.text = user.name
            self.viewUserInfo.isHidden = false
        }else{
            self.viewUserInfo.isHidden = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
