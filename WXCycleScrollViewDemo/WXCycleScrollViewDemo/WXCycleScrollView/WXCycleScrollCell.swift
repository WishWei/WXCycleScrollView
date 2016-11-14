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
    var titleBackgroundView:UIView?
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
        
        titleBackgroundView = UIView.init(frame: CGRect(x: 0, y: bounds.height - 60, width: bounds.width - 0, height: 40))
        contentView.addSubview(titleBackgroundView!)
        
        titleLabel = UILabel.init(frame: CGRect(x: 10, y: 0, width: titleBackgroundView!.bounds.width - 20, height: titleBackgroundView!.bounds.height))
        titleLabel!.numberOfLines = 2
        titleBackgroundView!.addSubview(titleLabel!)
        
    }
}
