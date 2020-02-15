//
//  IPAddressInfoViewModel.swift
//  CabIOS
//
//  Created by Ghafar Tanveer on 24/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class IPAddressInfoViewModel {
    var countryCode:String
    var country:String
    var lat:String
    var long:String
    
    
    init() {
        self.countryCode = ""
        self.country = ""
        self.lat = ""
        self.long = ""
    }
    convenience init(response:NSDictionary) {
        self.init()
        self.countryCode = response.object(forKey: "countryCode") as? String ?? ""
        self.country = response.object(forKey: "country") as? String ?? ""
        self.lat = response.object(forKey: "lat") as? String ?? ""
        self.long = response.object(forKey: "lon") as? String ?? ""
    }
}
