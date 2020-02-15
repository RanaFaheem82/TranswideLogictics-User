//
//  PriceHistoryViewModel.swift
//  Hitch
//
//  Created by Rapidzz Macbook on 01/12/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class PriceHistoryViewModel {
    
    var id: String
    var price: String
    var dateString: String
    var date: Date
    var productPropertyId: String
    var isPriceChanged: Bool
    
    init() {
        self.id = ""
        self.price = ""
        self.dateString = ""
        self.productPropertyId = ""
        self.date = Date()
        self.isPriceChanged = false
        
    }
    
    convenience init(price: JSON) {
        self.init()
        
        if let id = price["Id"].int{
            self.id = "\(id)"
        }
        if let id = price["Id"].string{
            self.id = id
        }
        
        self.price = price["ProductFieldValue"].string ?? ""
        let timeStamp = price["TimeStamp"].string ?? ""
        self.date = Utilities.getDate(string: timeStamp)
        self.dateString = Utilities.getDateFromString(string: timeStamp)
        self.productPropertyId = price["ProductPropertyId"].string ?? ""
    }
   
}
