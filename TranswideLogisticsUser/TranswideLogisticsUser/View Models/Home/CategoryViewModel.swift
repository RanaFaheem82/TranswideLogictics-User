//
//  CategoryViewModel.swift
//  Hitch
//
//  Created by apple on 11/5/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class CategoryViewModel {
    
    var id:String
    var name:String
    var detail:String
    var catUrl:String
    
    init() {
        self.id = ""
        self.name = ""
        self.detail = ""
        self.catUrl = ""
    }
    
    convenience init(category:JSON) {
        self.init()
        if let id = category["Id"].int{
            self.id = "\(id)"
        }
        if let id = category["Id"].string{
            self.id = id
        }
        self.name = category["Name"].string ?? ""
        self.detail = category["Description"].string ?? ""
        if let url = category["ImageUrl"].string{
            self.catUrl = url
        }
        if let url = category["CategoryUrl"].string{
            self.catUrl = url
        }
       
    }
}
