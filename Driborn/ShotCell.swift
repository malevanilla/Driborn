//
//  ShotCollectionViewCell.swift
//  Driborn
//
//  Created by alan chu on 2017/1/4.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
    }
}

class ShotCell: BaseCell {
    
    var shot: Shot? {
        didSet {
            setupShotImage()
        }
    }

    let shotImageView: MyImageView = {
        let imageView = MyImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
//        imageView.image = UIImage(named: "1")
        return imageView
    }()

    func setupShotImage() {
        if var shotImageUrl = shot?.images?.hidpi {
            print(shotImageUrl)
            
            if shotImageUrl == "" {
                shotImageUrl = (shot?.images?.normal)!
            }
            shotImageView.loadImageUsingUrlString(urlString: shotImageUrl as NSString)
        }
    }
    
    override func setupViews() {
        addSubview(shotImageView)
        addConstraintsWithFormat(format: "H:|-0-[v0]-0-|", views: shotImageView)
        addConstraintsWithFormat(format: "V:|-0-[v0]-0-|", views: shotImageView)
    }
    
    
}
