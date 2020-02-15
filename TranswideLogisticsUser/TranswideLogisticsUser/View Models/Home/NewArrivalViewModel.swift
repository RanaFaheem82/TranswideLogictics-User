//
//  NewArrivalViewModel.swift
//  Hitch
//
//  Created by apple on 11/5/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class NewArrivalViewModel {
    var title:String
    var productList:[ProductViewModel]
    
    
    init() {
        self.title = ""
        self.productList = [ProductViewModel]()
    }
    
    convenience init(data: JSON) {
        self.init()
        self.title = data["Title"].string ?? ""
        if let products = data["products"].array{
            for item in products{
                self.productList.append(ProductViewModel(product: item))
            }
        }
    }
}
