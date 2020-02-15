

import Foundation
import SwiftyJSON

class AllCategoriesViewModel {
    
    var id:String
    var name:String
    var Descirption:String
    var CreatedAt:String
    var CreatedBy:String
    var UpdatedAt:String
    var UpdatedBy:String
    var ImageUrl:String
    
    init() {
        self.id = ""
        self.name = ""
        self.Descirption = ""
        self.CreatedAt = ""
        self.CreatedBy = ""
        self.UpdatedAt = ""
        self.UpdatedBy = ""
        self.ImageUrl = ""
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
        self.Descirption = category["Description"].string ?? ""
        self.CreatedAt = category["CreatedAt"].string ?? ""
        self.CreatedBy = category["CreatedBy"].string ?? ""
        self.UpdatedAt = category["UpdatedAt"].string ?? ""
        self.UpdatedBy = category["UpdatedBy"].string ?? ""
        
        if let url = category["ImageUrl"].string{
            self.ImageUrl = url
        }
        if let url = category["CategoryUrl"].string{
            self.ImageUrl = url
        }
        
    }
}
