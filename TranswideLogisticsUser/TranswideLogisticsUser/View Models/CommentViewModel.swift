//
//  CommentViewModel.swift
//  Hitch
//
//  Created by Rapidzz Macbook on 02/12/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class CommentViewModel {
   
    var id: String
    var comment: String
    var createdAt: String
    
    init() {
        self.id = ""
        self.comment = ""
        self.createdAt = ""
    }
    convenience init(comment: JSON) {
        self.init()
        if let id = comment["id"].int{
            self.id = "\(id)"
        }
        if let id = comment["id"].string{
            self.id = id
        }
        self.comment = comment["comment"].string ?? ""
        self.createdAt = comment["created_at"].string ?? ""
    }
}
