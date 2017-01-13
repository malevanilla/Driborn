//
//  HttpController.swift
//  Driborn
//
//  Created by alan chu on 2017/1/4.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit
import Alamofire

class HttpHelper {
    
    let url = "https://api.dribbble.com/v1/"
    
    func sendShotRequest(module:String, completionHandler:@escaping (AnyObject?, NSError?) -> ()) {
        /**
         shot
         get https://api.dribbble.com/v1/shots
         */
        
        // Add Headers
        let headers: HTTPHeaders = [
            "Authorization": "Bearer 541543c38ceda79c3b802c913ff3e8d9ac460d033d7a018aa6da89f343fc179b",
            ]
        
        // Add URL parameters
        let urlParams = [
            "token_type": "bearer",
            "scope": "public write",
            "access_token": "541543c38ceda79c3b802c913ff3e8d9ac460d033d7a018aa6da89f343fc179b",
            ]
        let requestUrl = "\(self.url)\(module)"
        // Fetch Request
        Alamofire.request(requestUrl, method: .get, parameters: urlParams, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value as AnyObject?, nil)
                case .failure(let error):
                    completionHandler(nil, error as NSError?)
                }
        }
    }
    
    
}
