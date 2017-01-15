//
//  recentCell.swift
//  Driborn
//
//  Created by Alan on 17/1/14.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit

class RecentCell: PopularCell {
    
    dynamic override var params: Dictionary<String,Any> {
        get {
            return super.params
        }
        set {
            super.params = ["module": "shots", "sort": "recent", "page": super.currentPage]
        }
    }
    
}
