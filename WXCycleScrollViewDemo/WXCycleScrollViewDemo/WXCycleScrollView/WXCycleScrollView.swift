//
//  WXCycleScrollView.swift
//  zhihuDailySwift
//
//  Created by 魏希 on 16/10/28.
//  Copyright © 2016年 魏希. All rights reserved.
//

import UIKit


@objc protocol WXCycleScrollViewDelegate : NSObjectProtocol {
    //点击第index张图片
    @objc optional func cycleScrollView(_ cycleScrollView: WXCycleScrollView, didSelectAt index: Int)
}

class WXCycleScrollView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    private let baseNum:Int = 100
    var scrollInterval:Double = 5
    var autoScroll:Bool = true {
        didSet{
            timer?.invalidate()
            timer = nil
            if autoScroll {   
                configTimer()
            }
        }
    }
    var imageStrs:[String]? {
        didSet{
            if let _ = imageStrs{
                images = nil
                if(autoScroll){
                    configTimer()
                }
            }else {
                timer?.invalidate()
                timer = nil
            }
            collectionView?.reloadData()
            
        }
    }
    var images:[UIImage]? {
        didSet{
            if let _ = images{
                imageStrs = nil
                if(autoScroll){
                    configTimer()
                }
            }else {
                timer?.invalidate()
                timer = nil
            }
            collectionView?.reloadData()
        }
    }
    
    var titles:[String]? {
        didSet{
            if let count = titles?.count {
                pageControl?.numberOfPages = count
            }else {
                pageControl?.numberOfPages = 0
            }
            collectionView?.reloadData()
        }
    }
    var collectionView:UICollectionView?
    var pageControl:UIPageControl?
    
    var timer:Timer?
    weak var delegate: WXCycleScrollViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configView()
    }
    
    func configView() {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = bounds.size
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.white
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(WXCycleScrollCell.self, forCellWithReuseIdentifier: "WXCycleScrollCell")
        addSubview(collectionView!)
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: bounds.height - 20, width: bounds.width, height: 20))
        pageControl!.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        pageControl!.hidesForSinglePage = true
        addSubview(pageControl!)
        
    }
    
    func configTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: scrollInterval, repeats: true, block: { (timer:Timer) in
            DispatchQueue.main.async {
                var page:Int = Int(Float((self.collectionView?.contentOffset.x)! + 0.5*(self.collectionView?.frame.width)!) / Float((self.collectionView?.frame.width)!))
                page += 1
                if(page >= self.baseNum * (self.titles?.count)!){
                    page = 0
                }
                self.collectionView?.scrollToItem(at: IndexPath(row: page, section: 0), at: .centeredHorizontally, animated: true)
            }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = titles?.count {
            return count * baseNum
        }
        return 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:WXCycleScrollCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "WXCycleScrollCell", for: indexPath) as! WXCycleScrollCell
        let index:Int = indexPath.row % (self.titles?.count)!
        if let _imageStrs = imageStrs {
            if index < _imageStrs.count {
                cell.imageView?.sd_setImage(with: URL(string: _imageStrs[index]))
            }
        }else if let _images = images {
            if index < _images.count {
                cell.imageView?.image = _images[index]
            }
        }

        if let title = titles?[index] {
            cell.titleLabel?.text = title
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row % (self.titles?.count)!
        delegate?.cycleScrollView?(self, didSelectAt: index)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == collectionView {
            var page:Int! = Int(Float(scrollView.contentOffset.x + 0.5*(collectionView?.bounds.width)!) / Float((collectionView?.bounds.width)!))
            page = page % (self.titles?.count)!
            pageControl?.currentPage = page
        }
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if(autoScroll){
            timer?.invalidate()
            timer = nil
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if(autoScroll){
            timer?.invalidate()
            timer = nil
            configTimer()
        }
    }
}
