
import Foundation
import SwiftyJSON

class AllProductsViewModel {
    
    var id:String
    var name:String
    var Descirption:String
    var CreatedAt:String
    var CreatedBy:String
    var UpdatedAt:String
    var UpdatedBy:String
    var CategoryId:String
    var Tags:String
    
    init() {
        self.id = ""
        self.name = ""
        self.Descirption = ""
        self.CreatedAt = ""
        self.CreatedBy = ""
        self.UpdatedAt = ""
        self.UpdatedBy = ""
        self.CategoryId = ""
        self.Tags = ""
    }
    
    convenience init(product:JSON) {
        self.init()
        if let id = product["Id"].int{
            self.id = "\(id)"
        }
        if let id = product["Id"].string{
            self.id = id
        }
        self.name = product["Name"].string ?? ""
        self.Descirption = product["Description"].string ?? ""
        self.CreatedAt = product["CreatedAt"].string ?? ""
        self.CreatedBy = product["CreatedBy"].string ?? ""
        self.UpdatedAt = product["UpdatedAt"].string ?? ""
        self.UpdatedBy = product["UpdatedBy"].string ?? ""
        self.CategoryId = product["CategoryId"].string ?? ""
        self.Tags = product["Tags"].string ?? ""
     
        }
        
    }

