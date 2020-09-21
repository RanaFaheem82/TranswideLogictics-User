//
//  MyRidesViewModel.swift
//  TranswideLogisticsUser
//
//  Created by apple on 5/10/20.
//  Copyright © 2020 apple. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON

class MyRidesViewModel {
    
    
    var vehicleId : String
    var driverId: String
    var sourceAddress: String
    var destinationAddress: String
    var tripType : String
    var fare : String
    var weight : String
    var status : String
    var driverName : String
    var vehicleName : String
    var vehicleRegNo: String
    var tripId : String
    var user : UserViewModel?
    var driver : DriverViewModel?
    var date : String
    
    init()
    {
        self.vehicleId = ""
        self.driverId = ""
        self.sourceAddress = ""
        self.destinationAddress = ""
        self.tripType = ""
        self.fare = ""
        self.weight = ""
        self.status = ""
        self.driverName = ""
        self.vehicleName = ""
        self.vehicleRegNo = ""
        self.user = UserViewModel()
        self.driver = DriverViewModel()
        self.tripId = ""
        self.date = ""

        
    }
    
    init(data: JSON){
        self.vehicleId = data["vehicleId"].stringValue
        self.driverId = data["driverId"].stringValue
        self.sourceAddress = data["sourceAddress"].stringValue
        self.destinationAddress = data["destinationAddress"].stringValue
        self.tripType = data["tripType"].stringValue
        self.fare = data["fare"].stringValue
        self.weight = data["weight"].stringValue
        self.status = data["status"].stringValue
        self.driverName = data["driverName"].stringValue
        self.vehicleName = data["vehicleName"].stringValue
        self.vehicleRegNo = data["vehicleRegNo"].stringValue
        self.user = UserViewModel(user: data["User"])
        self.driver = DriverViewModel(driver: ["Driver"])
        self.tripId = data["tripId"].stringValue
        self.date = data["date"].stringValue
    }
}

