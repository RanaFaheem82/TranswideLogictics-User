

import Foundation
import SwiftyJSON

class AllCategoriesListViewModel {
    
    var categoryList: [AllCategoriesViewModel]
    
    
    init() {
        self.categoryList = [AllCategoriesViewModel]()
    }
    
    init(category: JSON) {
        
        self.categoryList = [AllCategoriesViewModel]()
        
        if let list = category["data"].array{
            for item in list{
                self.categoryList.append(AllCategoriesViewModel(category: item))
            }
        }
    }
}
