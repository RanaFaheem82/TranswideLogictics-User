//
//  ItemListViewModel.swift
//  Hitch
//
//  Created by apple on 11/5/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class ItemListViewModel {
    
    var categoryList:[CategoryViewModel]
    var bannerList:[ProductViewModel]
    var otherProductList:[ProductViewModel]
    var newArrivalList:[NewArrivalViewModel]
    
    
    
    init() {
        self.categoryList = [CategoryViewModel]()
        self.bannerList = [ProductViewModel]()
        self.otherProductList = [ProductViewModel]()
        self.newArrivalList = [NewArrivalViewModel]()
    }
    
    init(json:JSON) {
        self.categoryList = [CategoryViewModel]()
        self.bannerList = [ProductViewModel]()
        self.otherProductList = [ProductViewModel]()
        self.newArrivalList = [NewArrivalViewModel]()
        
        
        if let catList = json["categories"].array{
            for item in catList{
                self.categoryList.append(CategoryViewModel(category: item))
            }
        }
        if let banners = json["banners"].array{
            for item in banners{
                self.bannerList.append(ProductViewModel(product: item))
            }
        }
        self.newArrivalList.append(NewArrivalViewModel())
        self.newArrivalList.append(NewArrivalViewModel())
        if let list = json["homeProducts"].array{
            for item in list{
                self.newArrivalList.append(NewArrivalViewModel(data: item))
            }
        }
        self.newArrivalList.append(NewArrivalViewModel())
        if let products = json["otherProducts"].array{
            for item in products{
                self.otherProductList.append(ProductViewModel(product: item))
            }
        }
    }
}
