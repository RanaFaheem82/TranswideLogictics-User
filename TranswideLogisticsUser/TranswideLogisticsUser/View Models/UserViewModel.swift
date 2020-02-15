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
    var image:String
    var rewardAmount:Double
    
    override init() {
        self.userId = ""
        self.name = ""
        self.email = ""
        self.phoneNumber = ""
        self.image = ""
        self.rewardAmount = 0.0
        
    }
    
    convenience init(user: JSON) {
        self.init()
        
        self.userId = user["user_id"].string ?? ""
        if let id = user["user_id"].int{
            self.userId = "\(id)"
        }
        self.name = user["name"].string ?? ""
        self.email = user["email"].string ?? ""
        self.phoneNumber = user["phone_number"].string ?? ""
        self.image = user["image"].string ?? ""
        print(user["total_reward"].double ?? 10.0)
        self.rewardAmount = user["total_reward"].double ?? 0.0
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
       
        self.userId = aDecoder.decodeObject(forKey: "userId") as? String ?? ""
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.email = aDecoder.decodeObject(forKey: "email") as? String ?? ""
        self.phoneNumber = aDecoder.decodeObject(forKey: "phoneNumber") as? String ?? ""
        self.image = aDecoder.decodeObject(forKey: "image") as? String ?? ""
        let amount = aDecoder.decodeObject(forKey: "rewardAmount") as? String ?? "0.0"
        self.rewardAmount = Double(amount) ?? 0.0
        
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.userId, forKey: "userId")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.phoneNumber, forKey: "phoneNumber")
        aCoder.encode(self.image, forKey: "image")
        aCoder.encode("\(self.rewardAmount)", forKey: "rewardAmount")
    }
}
