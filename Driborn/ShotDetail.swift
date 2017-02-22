//
//  ShotDetail.swift
//  Driborn
//
//  Created by alan chu on 2017/1/18.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit

class ImageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ShotDetail: NSObject {
    
    
    func showDetailView(cellCenter:CGPoint){
        
        
        
        if let keywindow = UIApplication.shared.keyWindow{
           
            let view = UIView(frame: keywindow.frame)
            view.backgroundColor = .black
            view.frame = CGRect(x: cellCenter.x, y: cellCenter.y, width: 8, height: 6)
            
            keywindow.addSubview(view)
            
            let height = keywindow.frame.width / 4 * 3
        
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                view.frame = keywindow.frame
            }, completion: { (completedAnimation) in
                
                //
                
                
            })
            print("this is a view")
        }
        
        
    }
    
    
    
    
    
}


