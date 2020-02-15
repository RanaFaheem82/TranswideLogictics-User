//
//  RequestMessage.swift
//  InsafiansPTI
//
//  Created by Ghafar Tanveer on 01/01/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
import UIKit

class RequestMessage: ServiceRequestMessage {

    var queryItems = [URLQueryItem]()
    var deviceId:String = ""
    var userId:String = ""
    var fcmToken:String = ""
    var type:String = ""
    var email:String = ""
    var name:String = ""
    var firstName:String = ""
    var lastName:String = ""
    var password:String = ""
    var currentPassword:String = ""
    var message:String = ""
    var phone:String = ""
    var status:String = ""
    var id:String = ""
    var phoneCode: String = ""
    var image: UIImage = UIImage()
    var imageKey: String = ""
    var isUpdateProfile:Bool = false
    var title:String = ""
    var detail:String = ""
    var address:String = ""
    var comment:String = ""
    var rating: String = ""
    var categoryId:String = ""
    var productId:Int = 0
    
    
}


