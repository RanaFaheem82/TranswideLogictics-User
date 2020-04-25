//
//  CommentsTableViewCell.swift
//  Hitch
//
//  Created by apple on 18/11/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var lblComments: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    func configureComment(comment: CommentViewModel, index: Int) {
//        self.lblComments.text = comment.comment
//        if(index % 2 == 0){
//            self.commentView.backgroundColor = UIColor.hexStr("FFCCCC")
//        }else{
//            self.commentView.backgroundColor = UIColor.hexStr("BBABBF")
//        }
//    }
}
