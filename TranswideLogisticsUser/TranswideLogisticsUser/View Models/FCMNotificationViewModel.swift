//
//  FCMNotificationViewModel.swift
//  Fooding
//
//  Created by Ghafar Tanveer on 18/08/2017.
//  Copyright © 2017 Ghafar Tanveer. All rights reserved.
//

import Foundation
import SwiftyJSON

class FCMNotificationViewModel {
    
  
    var notiId:String
    var type:NotificationType
    var notiType:String
    var notifiactionId:String
    var notification:NotificationViewModel
    var amount: Double
    
    init() {
        
        self.notiId = ""
        self.notiType = ""
        self.notifiactionId = ""
        self.notification = NotificationViewModel()
        self.amount = 0.0
        self.type = .Default
    }
    
    convenience init(notification:[AnyHashable:Any]) {
        self.init()
        
        let json = JSON(notification)
       
        print(json)
        if let data = json["a_data"].string{
            if  let dict = data.toJSON() as? [String:AnyObject]{
                let jsonDict = JSON(dict)
                if let amount = jsonDict["reward_amount"].double{
                    self.amount = amount
                }
                if let amount = jsonDict["reward_amount"].int{
                    self.amount = Double(amount)
                }
                if let amount = jsonDict["reward_amount"].float{
                    self.amount = Double(amount)
                }
                if let a = jsonDict["reward_amount"].string{
                    self.amount = Double(a) ?? 0.0
                }
                print(jsonDict)
                self.notification = NotificationViewModel(data: jsonDict["notification_id"])
            }
            
        }
        

    }
    
}
