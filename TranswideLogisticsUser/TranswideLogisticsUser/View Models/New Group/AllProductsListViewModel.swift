

import Foundation
import SwiftyJSON

class AllProductsListViewModel {
    
    var productList: [AllProductsViewModel]
    
    
    init() {
        self.productList = [AllProductsViewModel]()
    }
    
    init(product: JSON) {
        
        self.productList = [AllProductsViewModel]()
        
        if let list = product["data"].array{
            for item in list{
                self.productList.append(AllProductsViewModel(product: item))
            }
            
            
        }
    }
    
    
}
