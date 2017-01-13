//
//  FeedCell.swift
//  Driborn
//
//  Created by Alan on 17/1/14.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit

class PopularCell: BaseCell,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    var shots = [Shot]()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let cellId = "cellId"
    
    override func setupViews() {
        super.setupViews()
        
        fetchShots()
       
        backgroundColor = UIColor.brown
       
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(ShotCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    func fetchShots() {
        
        let params: Dictionary<String, Any> = [
            "module": "shots",
            "list": "",
            "page": 1,
            ]
        ApiService.sharedInstance.fetchShot(params: params) { (shots: [Shot]) in
            self.shots = shots
            self.collectionView.reloadData()
        }
        
    }
    
//    MARK shotCell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ShotCell
        cell.shot = shots[indexPath.item]
        cell.backgroundColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.00)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 2, height: CGFloat(roundf(Float(frame.width / 8 * 3))) )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

}
