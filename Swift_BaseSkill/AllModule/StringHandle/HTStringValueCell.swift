//
//  HTStringValueCell.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/7/2.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import UIKit
import SnapKit

class HTStringValueCell: HTBaseTableCell {

    var valueLab:UILabel?
    
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
        valueLab = UILabel.init()
        valueLab?.textColor = UIColor.systemGray2
        valueLab?.font = UIFont.systemFont(ofSize: 16)
        valueLab?.textAlignment = NSTextAlignment.left
        valueLab?.numberOfLines = 0

        backgroundColor = UIColor.white
        addSubview(valueLab!)
    }
    
    override func createLayouts() {
        
        super.createLayouts()
        valueLab?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(15)
            make.top.equalTo(self).offset(0)
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

