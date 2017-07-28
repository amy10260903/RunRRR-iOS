//
//  MenuBarBelow.swift
//  RunRRR
//
//  Created by Jacky Huang on 2017/7/14.
//  Copyright © 2017年 EEECamp. All rights reserved.
//

import UIKit

class MenuBarBelow : UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let pages = ["Maps", "Missions", "Bags", "More"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.darkGray
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width/4-15, height: self.frame.height-5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarCell
        cell.backgroundColor = .blue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(2)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    let cellId = "MenuBarCellId"
    
    
    /* Initializing */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        self.backgroundColor = UIColor.darkGray
        addConstraintWithFormat(format: "H:|-10-[v0]-10-|", views: collectionView)
        addConstraintWithFormat(format: "V:|-8-[v0]-15-|", views: collectionView)
        collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class MenuBarCell : UICollectionViewCell {
    let pagesIconButton : UIButton = {
        let bt = UIButton()
        return bt
    }()
    
    let pagesColorBar : UIView = {
        let view = UIView()
        return view
    }()
    
    
    func setupCellView(){
        addSubview(pagesIconButton)
        addSubview(pagesColorBar)
    }
    
    /* Initializing */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
