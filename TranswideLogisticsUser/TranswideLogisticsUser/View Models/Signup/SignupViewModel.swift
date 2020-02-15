//
//  SignupViewModel.swift
//  InsafiansPTI
//
//  Created by Ghafar Tanveer on 12/01/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class SignupViewModel {
    var firstName:String
    var lastName:String
    var name:String
    var phone:String
    var password:String
    var image:UIImage
    var imageUrl:String
    var appId:String
    var accountType:String
    var email:String
    var countryCode:String
    var phoneNumber:String
    var phoneCode:String
    var isPhoneAlreadyExist:Bool
    var deviceId:String
    var providerId:String
    var country:String
    
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.name = ""
        self.phone = ""
        self.password = ""
        self.image = UIImage()
        self.imageUrl = ""
        self.appId = ""
        self.accountType = "email"
        self.email = ""
        self.countryCode = ""
        self.phoneNumber = ""
        self.phoneCode = ""
        self.isPhoneAlreadyExist = false
        self.deviceId = (UIDevice.current.identifierForVendor?.uuidString)!
        self.providerId = ""
        self.country = ""
        
    }
   
    
}
