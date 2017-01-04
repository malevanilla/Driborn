//
//  ViewController.swift
//  Driborn
//
//  Created by alan chu on 2017/1/4.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let http = ShotHelper()
        http.sendShotRequest(module: "shots")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

