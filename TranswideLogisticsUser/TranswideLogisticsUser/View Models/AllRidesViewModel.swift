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

class AllRidesViewModel {
    
    
    var currentRides : AllRidesListViewModel?
    var HistoryRides : AllRidesListViewModel?
    var bookedRides :  AllRidesListViewModel?
    
    init()
    {
        self.currentRides = AllRidesListViewModel()
        self.HistoryRides = AllRidesListViewModel()
        self.bookedRides = AllRidesListViewModel()
      

        
    }
    
    init(data: JSON){
        self.currentRides =  AllRidesListViewModel(list: data["Current"])
        self.HistoryRides = AllRidesListViewModel(list: data["History"])
        self.bookedRides = AllRidesListViewModel(list: data["Scheduled"])
    }
}

