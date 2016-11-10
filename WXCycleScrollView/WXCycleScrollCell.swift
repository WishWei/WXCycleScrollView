//
//  WXCycleScrollCell.swift
//  zhihuDailySwift
//
//  Created by 魏希 on 16/10/28.
//  Copyright © 2016年 魏希. All rights reserved.
//

import UIKit

class WXCycleScrollCell: UICollectionViewCell {
    var imageView:UIImageView?
    var titleLabel:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() {
        imageView = UIImageView.init(frame: bounds)
        contentView.addSubview(imageView!)
        
        titleLabel = UILabel.init(frame: CGRect(x: 10, y: bounds.height - 60, width: bounds.width - 20, height: 40))
        titleLabel!.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        titleLabel!.textColor = UIColor.white
        titleLabel!.font = UIFont.systemFont(ofSize: 16)
        titleLabel!.numberOfLines = 2
        titleLabel?.textAlignment = .left
        contentView.addSubview(titleLabel!)
        
    }
}
