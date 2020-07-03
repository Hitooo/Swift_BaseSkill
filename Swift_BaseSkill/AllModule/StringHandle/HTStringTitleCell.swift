//
//  HTStringTitleCell.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/7/2.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import UIKit
import SnapKit

class HTStringTitleCell: HTBaseTableCell {

    var titleLab:UILabel?
    
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
        titleLab?.textColor = UIColor.systemGray
        titleLab?.font = UIFont.boldSystemFont(ofSize: 26)
        titleLab?.textAlignment = NSTextAlignment.left
        titleLab?.numberOfLines = 0
        backgroundColor = UIColor.white
        addSubview(titleLab!)
    }
    
    override func createLayouts() {
        
        super.createLayouts()
        titleLab?.snp.makeConstraints({ (make) in
            make.left.top.equalTo(self).offset(15)
            make.right.bottom.equalTo(self).offset(-15)
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
