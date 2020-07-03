//
//  HTMainCell.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/6/30.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import UIKit
import SnapKit

class HTMainCell: HTBaseTableCell {

    var titleLab:UILabel?
    var classLab:UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       createUI()
       createLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func createUI() {
        
        super.createUI()
        titleLab = UILabel.init()
        titleLab?.textColor = UIColor.systemRed
        titleLab?.font = UIFont.boldSystemFont(ofSize: 24)
        titleLab?.textAlignment = NSTextAlignment.left
        classLab = UILabel.init()
        classLab?.textColor = UIColor.systemBlue
        classLab?.font = UIFont.systemFont(ofSize: 16)
        classLab?.textAlignment = NSTextAlignment.right
        
        backgroundColor = UIColor.white
        addSubview(titleLab!)
        addSubview(classLab!)
    }
    
    override func createLayouts() {
        
        super.createLayouts()
        titleLab?.snp.makeConstraints({ (make) in
            make.bottom.top.equalTo(self)
            make.left.equalTo(self).offset(15)
        })
        
        classLab?.snp.makeConstraints({ (make) in
            make.bottom.top.equalTo(self)
            make.right.equalTo(self).offset(-15)
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
