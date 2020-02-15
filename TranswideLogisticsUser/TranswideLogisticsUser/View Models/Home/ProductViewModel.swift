//
//  ProductViewModel.swift
//  Hitch
//
//  Created by apple on 11/5/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON
class ProductViewModel {
    
    var id:Int
    var name:String
    var detail:String
    var createdAt:String
    var updatedAt:String
    var updatedBy:String
    var categoryId:String
    var subCategoryId:String
    var price:String
    var productURL:String
    var isFavourite:Bool
    var priceHistory: [PriceHistoryViewModel]
    
    
    
    
    init() {
        self.id = 0
        self.name = ""
        self.detail = ""
        self.createdAt = ""
        self.updatedAt = ""
        self.updatedBy = ""
        self.categoryId = ""
        self.subCategoryId = ""
        self.price = ""
        self.productURL = ""
        self.isFavourite = false
        self.priceHistory = [PriceHistoryViewModel]()
    }
    
    convenience init(product:JSON) {
        self.init()
        
        self.id = product["Id"].int ?? 0
        self.name = product["Name"].string ?? ""
        self.detail = product["Description"].string ?? ""
        self.createdAt = product["CreatedAt"].string ?? ""
        self.updatedAt = product["UpdatedAt"].string ?? ""
        self.updatedBy = product["UpdatedBy"].string ?? ""
        self.categoryId = product["CategoryId"].string ?? ""
        self.subCategoryId = product["SubCategoryId"].string ?? ""
       
        self.productURL = product["ProductURLs"].string ?? ""
        if let url = product["ImageUrl"].string{
            self.productURL = url
        }
        if let list = product["Price"].array{
            for item in list{
                self.priceHistory.append(PriceHistoryViewModel(price: item))
                
            }
        }
        
        let list = self.priceHistory.sorted(by: { $0.date.compare($1.date) == .orderedDescending })
        self.priceHistory = list
        if(self.priceHistory.count > 1){
            var price = self.priceHistory[0].price
            for i in 0..<self.priceHistory.count{
                if(price != self.priceHistory[i].price){
                    price = self.priceHistory[i].price
                    self.priceHistory[i].isPriceChanged = true
                }
            }
        }
        
        
    }
}
