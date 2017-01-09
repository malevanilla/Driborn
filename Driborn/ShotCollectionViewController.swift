//
//  ShtoCollectionViewController.swift
//  Driborn
//
//  Created by alan chu on 2017/1/9.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "shotCell"

class ShtoCollectionViewController: UIViewController {
    

    @IBOutlet weak var shotCollectionView: UICollectionView!
    
    var imageArray = [UIImage(named:"1"), UIImage(named:"2"), UIImage(named:"3"), UIImage(named:"4"), UIImage(named:"5"), UIImage(named:"6"), UIImage(named:"7"), UIImage(named:"8"), UIImage(named:"9"), UIImage(named:"10"), UIImage(named:"11"), UIImage(named:"12")]

    override func viewDidLoad() {
        super.viewDidLoad()

        let http = ShotHelper()
        http.sendShotRequest(module: "shots")
//        setupCollectionView()
        self.shotCollectionView.delegate = self
        self.shotCollectionView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


extension ShtoCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShotCollectionViewCell
        cell.imageView.image = imageArray[indexPath.row]
        cell.wid
        // Configure the cell
        return cell
    }
}

