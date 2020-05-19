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

class NearbyDriverViewModel {
    
    
    var latitude : String
    var longitude: String

    
    init()
    {
        self.latitude = ""
        self.longitude = ""
       

        
    }
    
    init(data: JSON){
        self.latitude = data["latitude"].stringValue
        self.longitude = data["longitude"].stringValue
        
    }
}

