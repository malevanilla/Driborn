//
//  MenuBar.swift
//  Driborn
//
//  Created by Alan on 17/1/11.
//  Copyright © 2017年 alan chu. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let menuNames = ["Popular", "Recent", "Debuts", "Following"]
    
    var shotCollectionViewController: ShotCollectionViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        //        backgroundColor = UIColor.black
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .init(rawValue: 0))
        
        //设置焦点
        setupFocusBar()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var focusBarLeftAnchorConstraint: NSLayoutConstraint?

    func setupFocusBar() {
        let focusBarView = UIView()
        focusBarView.backgroundColor = UIColor(red:0.92, green:0.30, blue:0.54, alpha:1.00)
        focusBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(focusBarView)
        
        
        focusBarLeftAnchorConstraint = focusBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        
        focusBarLeftAnchorConstraint?.isActive = true
        focusBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        focusBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        focusBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.item)
//        let x = CGFloat(indexPath.item) * frame.width / 4
//        focusBarLeftAnchorConstraint?.constant = x
//        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {self.layoutIfNeeded()}, completion: nil)
        
        //切换view
        shotCollectionViewController?.scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.label.text = menuNames[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class MenuCell: BaseCell {
    
    let label: UILabel =  {
        let lb = UILabel()
        lb.font = lb.font.withSize(14)
        lb.textColor = UIColor(red:0.62, green:0.64, blue:0.65, alpha:1.00)
        return lb
    }()
    
    override var isHighlighted: Bool {
        didSet {
            label.textColor = isHighlighted ? UIColor(red:0.92, green:0.30, blue:0.54, alpha:1.00) : UIColor(red:0.62, green:0.64, blue:0.65, alpha:1.00)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            label.textColor = isSelected ? UIColor(red:0.92, green:0.30, blue:0.54, alpha:1.00) : UIColor(red:0.62, green:0.64, blue:0.65, alpha:1.00)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(label)
        addConstraintsWithFormat(format: "H:[v0]", views: label)
        addConstraintsWithFormat(format: "V:[v0]", views: label)
        addConstraint(NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
