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
    
    var params: Dictionary<String, Any>!
    
    func sendShotRequest(completionHandler:@escaping (Any?, Error?) -> ()) {
        /**
         shot
         get https://api.dribbble.com/v1/shots
         */
        
        // Add Headers
        let headers: HTTPHeaders = [
            "Authorization": "Bearer 541543c38ceda79c3b802c913ff3e8d9ac460d033d7a018aa6da89f343fc179b",
            ]
        
        // Add URL parameters
        var urlParams: Dictionary<String, Any> = [
            "token_type": "bearer",
            "scope": "public write",
            "access_token": "541543c38ceda79c3b802c913ff3e8d9ac460d033d7a018aa6da89f343fc179b",
            ]
        
        //
        print(params)
        
        for (key, value) in params {
            urlParams[key] = value
        }
        urlParams.removeValue(forKey: "module")
        print(urlParams)
        
        
        let requestUrl = "\(self.url)\(params?["module"] as! String)"
        
        print(requestUrl)
        // Fetch Request
        Alamofire.request(requestUrl, method: .get, parameters: urlParams, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value, nil)
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    
}
