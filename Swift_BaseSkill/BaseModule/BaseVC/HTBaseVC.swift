//
//  HTBaseVC.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/7/1.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import UIKit
import SnapKit

class HTBaseVC: UIViewController,HTBaseUIProtocol {
    
    var tableView:UITableView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        createLayouts()
    }
    
    func createUI() {
        
        view.backgroundColor = UIColor.systemBackground
        tableView = UITableView.init(frame: CGRect.zero, style: UITableView.Style.insetGrouped)
        tableView?.tableFooterView = UIView.init()
        view.addSubview(tableView!)
    }
    
    func createLayouts() {
                
        tableView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(self.view)
        })
    }

}
