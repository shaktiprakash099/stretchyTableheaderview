//
//  DetailsheaderView.swift
//  Photos-DucTran
//
//  Created by GLB-312-PC on 05/06/18.
//  Copyright © 2018 Developers Academy. All rights reserved.
//

import UIKit
class DetailsheaderView :UIView{
    @IBOutlet weak var imageview: UIImageView!
    var image: UIImage?{
        didSet{
            if let image = image {
                imageview.image = image
            }
            else{
                imageview.image = nil
            }
        }
    }
}












