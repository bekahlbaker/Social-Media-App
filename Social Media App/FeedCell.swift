//
//  FeedCell.swift
//  Social Media App
//
//  Created by Rebekah Baker on 10/28/16.
//  Copyright © 2016 Rebekah Baker. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    
    var post: Post!

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configureCell(post: Post) {
        self.post = post
        self.caption.text = post.caption
        self.likesLbl.text = String(post.likes)
        
    }

}
