//
//  ViewController.swift
//  WXCycleScrollViewDemo
//
//  Created by 魏希 on 2016/11/9.
//  Copyright © 2016年 魏希. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,WXCycleScrollViewDelegate{
    
    var tableView:UITableView!
    var cycleScrollView:WXCycleScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        title = "demo"
        
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        cycleScrollView = WXCycleScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 240))
        cycleScrollView?.delegate = self
        tableView!.tableHeaderView = cycleScrollView
        
        cycleScrollView?.imageStrs = ["http://pic3.zhimg.com/91b3c622e588b2f4d42176f1f3fff626.jpg","http://pic1.zhimg.com/6078a56f4344c0e994d030e6570a5ed8.jpg","http://pic3.zhimg.com/7766a061e3374ca2f498f6ed589e105e.jpg"]
        cycleScrollView?.titles = ["特朗普当选美国总统，对全球经济有什么影响？","性格特点会影响大选吗？会，而且影响很大","这里是广告 · 青年的进阶，是中年还是高级玩家？"]
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseId:String! = "tableViewCell"
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: reuseId)
        
        if let _ = cell {
            
        }else{
            cell = UITableViewCell(style: .default, reuseIdentifier: "tableViewCell")
            cell?.selectionStyle = .none
        }
        cell?.textLabel?.text = "NO \(indexPath.row) row"
        return cell!
    }
    
    func cycleScrollView(_ cycleScrollView: WXCycleScrollView, didSelectAt index: Int) {
        print("image \(index) clicked")
    }
    
    
}
