//
//  BarcodeView.swift
//  RunRRR
//
//  Created by Jacky Huang on 2017/8/3.
//  Copyright © 2017年 EEECamp. All rights reserved.
//

import UIKit

class BarcodeView: UIView{
    
    let smallCircle = UIImageView()
    let titleBarView = UIView()
    let titleLabel = UILabel()
    let userID = UserDefaults.standard.integer(forKey: "RunRRR_UID")
    let barcodeImageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTitleBarView()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(titleBarView)
        addSubview(barcodeImageView)
        addConstraintWithFormat(format: "H:|[v0]|", views: titleBarView)
        addConstraintWithFormat(format: "V:|[v0(50)]", views: titleBarView)
        addConstraintWithFormat(format: "H:|-20-[v0]-20-|", views: barcodeImageView)
        addConstraintWithFormat(format: "V:[v0]-100-[v1(100)]", views: titleBarView,barcodeImageView)
        
        barcodeImageView.image = encodeImageFromUID(userID)
    }
    func setupTitleBarView(){
        titleBarView.backgroundColor = .green
        titleBarView.addSubview(smallCircle)
        titleBarView.addSubview(titleLabel)
        titleLabel.text = "BARCODE"
        titleLabel.textColor = .white
        smallCircle.image = UIImage(named: "bar_circle_icon")
        smallCircle.contentMode = .scaleAspectFill
        let smallCircleSize = titleBarView.frame.height - 4
        addConstraintWithFormat(format: "H:|-5-[v0(\(smallCircleSize))]-5-[v1]-5-|", views: smallCircle, titleLabel)
        addConstraintWithFormat(format: "V:|-2-[v0(\(smallCircleSize))]-2-|", views: smallCircle)
        addConstraintWithFormat(format: "V:|-2-[v0(\(smallCircleSize))]-2-|", views: titleLabel)
    }
    func encodeImageFromUID(_ uid: Int) -> UIImage? {
        let uidString = String(uid)
        let data = uidString.data(using: .ascii)
        let filter = CIFilter(name: "CICode128BarcodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        
        return UIImage(ciImage: (filter?.outputImage)!)
    }
}
