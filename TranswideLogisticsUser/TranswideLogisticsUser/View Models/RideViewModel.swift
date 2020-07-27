//
//  UserViewModel.swift
//  WrestlerBlower
//
//  Created by Rapidzz Macbook on 03/09/2019.
//  Copyright © 2019 Rapidzz. All rights reserved.
//

import Foundation
import SwiftyJSON


class RideViewModel{
    
   
    var id:String
    
    init() {
        
        self.id = ""
        
        
    }
    
    convenience init(ride: JSON) {
        self.init()
        
        self.id = ride["requestId"].string ?? ""
        if let id = ride["requestId"].int{
            self.id = "\(id)"
        }
    }
    
  
    
}
