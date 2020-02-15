//
//  CommentListViewModel.swift
//  Hitch
//
//  Created by Rapidzz Macbook on 02/12/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class CommentListViewModel {
    var commentList: [CommentViewModel]
    
    init() {
        self.commentList = [CommentViewModel]()
    }
    init(data: JSON) {
        self.commentList = [CommentViewModel]()
        if let list = data["data"].array{
            for item in list{
                self.commentList.append(CommentViewModel(comment: item))
            }
        }
    }
    
}
