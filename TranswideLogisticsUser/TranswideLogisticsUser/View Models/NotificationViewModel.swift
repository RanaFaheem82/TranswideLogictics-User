//
//  NotificationViewModel.swift
//  WrestlerBlower
//
//  Created by Rapidzz Macbook on 18/09/2019.
//  Copyright © 2019 Rapidzz. All rights reserved.
//

import Foundation
import SwiftyJSON


class NotificationViewModel {
    
    
    var complaintId: String = ""
    var title: String = ""
    var id: String = ""
    var notificationId: String = ""
    var message: String = ""
    var date: String = ""
    
    init() {
        self.complaintId = ""
        self.title = ""
        self.id = ""
        self.notificationId = ""
        self.message = ""
        self.date = ""
    }
    
    
    init(data: JSON) {
        self.complaintId = "\(data["case_id"].int ?? 0)"
        self.title = data["title"].string ?? ""
        self.id = "\(data["id"].int ?? 0)"
        self.notificationId = data["notification_id"].string ?? ""
        self.message = data["message"].string ?? ""
        self.date = data["date"].string ?? ""
    }
    
}
