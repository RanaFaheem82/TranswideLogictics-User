//
//  UserViewModel.swift
//  WrestlerBlower
//
//  Created by Rapidzz Macbook on 03/09/2019.
//  Copyright © 2019 Rapidzz. All rights reserved.
//

import Foundation
import SwiftyJSON


class UserViewModel: NSObject, NSCoding {
    
    var token:String
    var id:String
    var name:String
    var email:String
    var address:String
    var profileImg:String
    
    override init() {
        self.token = ""
        self.id = ""
        self.name = ""
        self.email = ""
        self.address = ""
        self.profileImg = ""
        
    }
    
    convenience init(user: JSON) {
        self.init()
        
        self.id = user["_id"].string ?? ""
        if let id = user["_id"].int{
            self.id = "\(id)"
        }
        self.name = user["name"].string ?? ""
        self.email = user["email"].string ?? ""
        self.token = user["token"].string ?? ""
        self.profileImg = user["profileImg"].string ?? ""
        self.address = user["address"].string ?? ""
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
       
        self.id = aDecoder.decodeObject(forKey: "userId") as? String ?? ""
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.email = aDecoder.decodeObject(forKey: "email") as? String ?? ""
        self.token = aDecoder.decodeObject(forKey: "token") as? String ?? ""
        self.profileImg = aDecoder.decodeObject(forKey: "profileImg") as? String ?? ""
       self.address = aDecoder.decodeObject(forKey: "address") as? String ?? ""
        
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "userId")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.token, forKey: "token")
        aCoder.encode(self.profileImg, forKey: "profileImg")
          aCoder.encode(self.address, forKey: "address")
    }
}
