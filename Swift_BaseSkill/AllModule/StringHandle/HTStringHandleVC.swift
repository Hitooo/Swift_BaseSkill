//
//  HTStringHandleVC.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/7/2.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import UIKit

class HTStringHandleVC: HTBaseVC,UITableViewDataSource,UITableViewDelegate {

    var dataArr = [HTStringHandleModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
    }
    
    override func createUI() {
        
        super.createUI()
        title = "我是字符串处理"
        view.backgroundColor = UIColor.systemBackground
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 60
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(HTStringTitleCell.self, forCellReuseIdentifier: "title")
        tableView?.register(HTStringValueCell.self, forCellReuseIdentifier: "value")
        tableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func createLayouts() {
        super.createLayouts()
    }
    
    func createData() -> Void {
        
        var model1 = HTStringHandleModel.init()
        model1.type = "title";
        model1.content = "Unicode"
        dataArr.append(model1)
        
        model1 = HTStringHandleModel.init()
        model1.type = "value";
        model1.content = "Unicode是一个用于在不同书写系统中对文本进行编码、表示和处理的国际标准。它使你可以用标准格式表示来自任意语言几乎所有的字符，并能够对文本文件或网页这样的外部资源中的字符进行读写操作。Swift 的 String 和 Character 类型是完全兼容 Unicode 标准的。"
        dataArr.append(model1)
        
        model1 = HTStringHandleModel.init()
        model1.type = "title";
        model1.content = "Unicode 标量"
        dataArr.append(model1)
        
        model1 = HTStringHandleModel.init()
        model1.type = "value";
        model1.content = """
        Swift 的 String 类型是基于 Unicode 标量 建立的。Unicode 标量是对应字符或者修饰符的唯一的 21 位数字，例如 U+0061 表示小写的拉丁字母（LATIN SMALL LETTER A）（"a"），U+1F425 表示小鸡表情（FRONT-FACING BABY CHICK）（"🐥"）。
        请注意，并非所有 21 位 Unicode 标量值都分配给字符，某些标量被保留用于将来分配或用于 UTF-16 编码。已分配的标量值通常也有一个名称，例如上面示例中的 LATIN SMALL LETTER A 和 FRONT-FACING BABY CHICK。
        """
        dataArr += [model1]
        
        tableView?.reloadData()
    }
    
    //MARK:UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = dataArr[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: model.type!) as? HTBaseTableCell
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        
        if model.type == "title" {
            let tempCell = cell as? HTStringTitleCell
            tempCell?.titleLab?.text = model.content
        }
        else{
            let tempCell = cell as? HTStringValueCell
            tempCell?.valueLab?.text = model.content
        }
        
        return cell!
    }
}
