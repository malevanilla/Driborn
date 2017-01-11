//
//  HttpController.swift
//  Driborn
//
//  Created by alan chu on 2017/1/4.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HttpHelper {
    
    let url = "https://api.dribbble.com/v1/"
    
    func sendShotRequest(module:String) {
        /**
         shot
         get https://api.dribbble.com/v1/shots
         */
        
        // Add Headers
        let headers: HTTPHeaders = [
            "Authorization":"Bearer 541543c38ceda79c3b802c913ff3e8d9ac460d033d7a018aa6da89f343fc179b",
            ]
        
        // Add URL parameters
        let urlParams = [
            "token_type" : "bearer",
            "scope" : "public write",
            "access_token":"541543c38ceda79c3b802c913ff3e8d9ac460d033d7a018aa6da89f343fc179b",
            ]
        
        let requestUrl = "\(self.url)\(module)"
        
        // Fetch Request
        Alamofire.request(requestUrl, method: .get, parameters: urlParams, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                if (response.result.error == nil) {
                    
                    let data = JSON(response.result.value!)
                    
                    for d in data {
                        print(d.1)
//                        print(d.1["images"]["normal"])
                    }
//                    print(data)
                    
//                    debugPrint("HTTP Response Body: \(response.result.value)")
                }
                else {
                    debugPrint("HTTP Request failed: \(response.result.error)")
                }
        }
    }
    
    
}
