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
    var shotIdArray = [Int]()
    var currentPage = 1
    public var params: Dictionary<String, Any> = [
        "module": "shots",
        ]
    
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let cellId = "cellId"
    var allowLoadMore = true
    
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
        
        self.params["page"] = currentPage
        ApiService.sharedInstance.fetchShot(params: self.params) { (shots: [Shot]) in
            
            if self.currentPage == 1 {
                self.shots = shots
                for shot in shots {
                    self.shotIdArray.append(shot.id)
                }
                
            } else {
                self.allowLoadMore = true
                
//                var shotArray:[Shot] = shots                
                
//                for (i,shot) in shots.enumerated() {
//                    
//                    if self.shotIdArray.contains(shot.id) {
//                        shotArray.remove(at: i)
//                    } else {
//                        self.shotIdArray.append(shot.id)
//                    }
//                }
                self.shots = self.shots + shots
            }
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
        
        if allowLoadMore && currentPage < 50 {
            loadMore()
        }
        
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
    
    func loadMore() {
        allowLoadMore = false
        currentPage = currentPage + 1
        fetchShots()
    }
    
}
