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
    
    var userId:String
    var name:String
    var email:String
    var phoneNumber:String
    var profileImage:String
    var address:String
    
    override init() {
        self.userId = ""
        self.name = ""
        self.email = ""
        self.phoneNumber = ""
        self.profileImage = ""
        self.address = ""
        
    }
    
    convenience init(user: JSON) {
        self.init()
        
        self.userId = user["_id"].string ?? ""
        if let id = user["_id"].int{
            self.userId = "\(id)"
        }
        self.name = user["name"].string ?? ""
        self.email = user["email"].string ?? ""
        self.phoneNumber = user["phoneNumber"].string ?? ""
        self.profileImage = user["profileImg"].string ?? ""
        self.address = user["address"].string ?? ""
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
       
        self.userId = aDecoder.decodeObject(forKey: "userId") as? String ?? ""
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.email = aDecoder.decodeObject(forKey: "email") as? String ?? ""
        self.phoneNumber = aDecoder.decodeObject(forKey: "phoneNumber") as? String ?? ""
        self.profileImage = aDecoder.decodeObject(forKey: "profileImg") as? String ?? ""
       self.address = aDecoder.decodeObject(forKey: "address") as? String ?? ""
        
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.userId, forKey: "userId")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.phoneNumber, forKey: "phoneNumber")
        aCoder.encode(self.profileImage, forKey: "profileImg")
          aCoder.encode(self.address, forKey: "address")
    }
}
