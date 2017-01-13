//
//  DebutsCell.swift
//  Driborn
//
//  Created by Alan on 17/1/14.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit

class DebutsCell: PopularCell {
    
    override func fetchShots() {
        
        let params: Dictionary<String, Any> = [
            "module": "shots",
            "list": "debuts",
            "page": 1,
            ]
        ApiService.sharedInstance.fetchShot(params: params) { (shots: [Shot]) in
            self.shots = shots
            self.collectionView.reloadData()
        }
        
    }


}
