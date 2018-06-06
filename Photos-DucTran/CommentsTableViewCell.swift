//
//  CommentsTableViewCell.swift
//  Photos-DucTran
//
//  Created by GLB-312-PC on 05/06/18.
//  Copyright © 2018 Developers Academy. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentTextLabel : UILabel!
    
    var comment : Comment?{
        didSet{
            if let comment = comment {
                userNameLabel.text = comment.user.toString()
                userNameLabel.textColor = comment.user.toColor()
                commentTextLabel.text = comment.text
            }
            
            else{
                userNameLabel.text = nil
                commentTextLabel.text = nil
            }
        }
    }

}
