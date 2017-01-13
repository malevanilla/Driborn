//
//  ShtoCollectionViewController.swift
//  Driborn
//
//  Created by alan chu on 2017/1/9.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit


class ShotCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    
    
    var cellId = "cellId"
    var debutsCellId = "debutsCellId"
    var recentCellId = "recentCellId"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        //set navigation title color
        let titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: view.frame.width - 32, height: 44))
        titleLabel.text = "Shot"
        titleLabel.textColor = UIColor(red:0.92, green:0.30, blue:0.54, alpha:1.00)
        navigationItem.titleView = titleLabel
        
        setupCollectionView()
        setupMenuBar()
        //获取数据
        
        
    }
    
    func setupCollectionView() {
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(PopularCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(RecentCell.self, forCellWithReuseIdentifier: recentCellId)
        collectionView?.register(DebutsCell.self, forCellWithReuseIdentifier: debutsCellId)
        
        //collectionView向下移动50像素
        collectionView?.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        
        collectionView?.isPagingEnabled = true
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .init(rawValue: 0), animated: true)
    }
    
    //MARK 导航条
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.shotCollectionViewController = self
        return mb
    }()
    
    private func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        
        let focusView = UIView()
        focusView.backgroundColor = UIColor(red:0.92, green:0.30, blue:0.54, alpha:1.00)
        view.addSubview(focusView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: focusView)
        view.addConstraintsWithFormat(format: "V:[v0]", views: focusView)
        
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(40)]", views: menuBar)
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.focusBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPath = IndexPath(item: index, section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .init(rawValue: 0))
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier: String
        
        switch indexPath.item {
        case 1:
            identifier = recentCellId
        case 2:
            identifier = debutsCellId
        default:
            identifier = cellId
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width, height: view.frame.height - 40)
        }
        
        
        
        
}




