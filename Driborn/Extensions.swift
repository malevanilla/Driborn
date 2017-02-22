//
//  Extension.swift
//  Driborn
//
//  Created by Alan on 17/1/11.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = view
        }
        //        translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
    }
    
}

let imageCache = NSCache<NSString, UIImage>()
class MyImageView: UIImageView {
    
    var imageUrlString: NSString?
    
    
    func loadImageUsingUrlString(urlString: NSString) {
        
        let url = URL(string: urlString as String)
        
        imageUrlString = urlString
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            
            
            self.image = imageFromCache
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, responds, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async(execute:{
                
                let imageToCache = UIImage(data: data!)
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                imageCache.setObject(imageToCache!, forKey: urlString)
            })
        }).resume()
        
    }
}

extension CGPoint {
    func collectionCellCenter(indexPath:IndexPath){
        
    }
}

