//
//  NotificationListViewModel.swift
//  WrestlerBlower
//
//  Created by Rapidzz Macbook on 18/09/2019.
//  Copyright © 2019 Rapidzz. All rights reserved.
//

import Foundation
import SwiftyJSON

class NotificationListViewModel {
    
    var notificationList: [NotificationViewModel]
    
    
    init() {
        self.notificationList = [NotificationViewModel]()
    }
    
    init(data:JSON) {
        self.notificationList = [NotificationViewModel]()
        
        if let array = data.array{
            for item in array{
                self.notificationList.append(NotificationViewModel(data: item))
            }
        }
    }
    
    
}
