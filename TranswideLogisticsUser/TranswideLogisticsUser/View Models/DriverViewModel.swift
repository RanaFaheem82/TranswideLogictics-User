//
//  MyRidesViewModel.swift
//  TranswideLogisticsUser
//
//  Created by apple on 5/10/20.
//  Copyright © 2020 apple. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON

class DriverViewModel {

    var _id : String
    var name: String
    var cnic: String
    var phoneNumber: String
    var address : String
    var profileImg : String
 
  
    
    init()
    {
        self._id = ""
        self.name = ""
        self.cnic = ""
        self.phoneNumber = ""
        self.address = ""
        self.profileImg = ""
        

        
    }
    
    init(driver: JSON){
        self._id = driver["vehic_idleId"].stringValue
        self.name = driver["name"].stringValue
        self.cnic = driver["cnic"].stringValue
        self.phoneNumber = driver["destphoneNumberinationAddress"].stringValue
        self.address = driver["address"].stringValue
        self.profileImg = driver["profileImg"].stringValue
        
    }
}

