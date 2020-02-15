//
//  ProductListViewModel.swift
//  Hitch
//
//  Created by Rapidzz Macbook on 08/11/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class ProductListViewModel {
    
    var productList: [ProductViewModel]
    
    
    init() {
        self.productList = [ProductViewModel]()
    }
    
    init(products: JSON) {
        
        self.productList = [ProductViewModel]()
        
        if let list = products["data"].array{
            for item in list{
                self.productList.append(ProductViewModel(product: item))
            }
        }
    }
}
