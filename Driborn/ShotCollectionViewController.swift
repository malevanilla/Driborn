//
//  ShtoCollectionViewController.swift
//  Driborn
//
//  Created by alan chu on 2017/1/9.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit
import SwiftyJSON

private let reuseIdentifier = "shotCell"

class ShotCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var imageArray = [UIImage(named:"1"), UIImage(named:"2"), UIImage(named:"3"), UIImage(named:"4"), UIImage(named:"5"), UIImage(named:"6"), UIImage(named:"7"), UIImage(named:"8"), UIImage(named:"9"), UIImage(named:"10"), UIImage(named:"11"), UIImage(named:"12")]
    
    var shotArray: [Shot]?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isTranslucent = false
        
        //set navigation title color
        let titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Shot"
        titleLabel.textColor = UIColor(red:0.92, green:0.30, blue:0.54, alpha:1.00)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(ShotCell.self, forCellWithReuseIdentifier: "cellId")
        
        //collectionView向下移动50像素
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setupMenuBar()
        let http = HttpHelper()
        http.sendShotRequest(module: "shots") { responseObject, error in
            if error == nil {
                let data = JSON(responseObject as AnyObject)
                
                print(data)
                
                let shot: Shot = {
                    let s = Shot()
                    
                    return s
                }()
                
                
                
            }
        }
    }
    
    //MARK 导航条
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shotArray?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
         cell.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2, height: (view.frame.width / 2) / 4 * 3 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
//    func setupCollectionView() {
//        
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        shotCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
//        shotCollectionView.register(ShotCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        shotCollectionView.backgroundColor = UIColor.white
//        shotCollectionView.delegate = self
//        shotCollectionView.dataSource = self
//        
//    }
}


//extension ShotCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return imageArray.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShotCollectionViewCell
//        cell.imageView.image = imageArray[indexPath.row]
//        // Configure the cell
//        return cell
//    }
//}

