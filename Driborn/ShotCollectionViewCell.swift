//
//  ShotCollectionViewCell.swift
//  Driborn
//
//  Created by alan chu on 2017/1/4.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit

class ShotCollectionViewCell: UICollectionViewCell {
    
    var imageView:UIImageView!
    var image:UIImage!
    
    var imageOffset:CGPoint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    func setupImageView() {
        
    }
    
    
    
    
}
