//
//  LogoutViewCell.swift
//  RunRRR
//
//  Created by Jacky Huang on 2017/8/4.
//  Copyright © 2017年 EEECamp. All rights reserved.
//

import UIKit

class LogoutTableViewCell: UITableViewCell {
    let smallCircle = UIImageView()
    let titleBarView = UIView()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
