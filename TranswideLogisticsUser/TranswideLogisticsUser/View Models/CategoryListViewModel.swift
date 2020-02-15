//
//  CategoryListViewModel.swift
//  Hitch
//
//  Created by Rapidzz Macbook on 26/11/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON


class CategoryListViewModel {
    
    var categoryList: [CategoryViewModel]
    
    init() {
        self.categoryList = [CategoryViewModel]()
    }
    
    init(date:JSON) {
        self.categoryList = [CategoryViewModel]()
        
        
    }
    
}
