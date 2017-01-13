//
//  ApiService.swift
//  Driborn
//
//  Created by Alan on 17/1/14.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit
import SwiftyJSON

class ApiService: NSObject {

    static let sharedInstance = ApiService()
    
    func fetchShot(params: Dictionary<String,Any>, completion: @escaping ([Shot]) -> () ) {
        let http = HttpHelper()
        http.params = params
        http.sendShotRequest() { responseObject, error in
            if error == nil {
                let data = JSON(responseObject!)
                
                var shots = [Shot]()
                for item in data {
                    
                    let shot = Shot()
                    let images = Images()
                    shot.id = Int(item.1["id"].stringValue)!
                    shot.title = item.1["title"].stringValue
                    
                    images.hidpi = item.1["images"]["hidpi"].stringValue
                    images.normal = item.1["images"]["normal"].stringValue
                    images.teaser = item.1["images"][" teaser"].stringValue
                    
                    shot.images = images
//                    print("from api:\(shot.images?.normal)")
                    shots.append(shot)
                }
                DispatchQueue.main.async {
                    completion(shots)
                }
                
                
            }
        }
    }
    
}
