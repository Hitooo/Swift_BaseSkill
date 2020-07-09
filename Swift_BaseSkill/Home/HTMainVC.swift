//
//  HTMainVC.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/6/30.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import UIKit
import KakaJSON

class HTMainVC: HTBaseVC,UITableViewDelegate,UITableViewDataSource {
    
    let dataArr = [
        [
            ["title":"基础部分","class":"HTSkillBaseVC"],
            ["title":"基础运算符","class":"HTStringHandleVC"],
            ["title":"控制流","class":"HTControllFlowVC"],
        ],
        [
            ["title":"函数和闭包","class":"HTFunctionBlockVC"],
            ["title":"枚举","class":"HTEnumVC"],
            ["title":"泛型","class":"HTGenericVC"],
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStr = "https://miniapi.retailo2o.com/common/cms/publish/999/sdeerversion2020.json?_platform_num=101273"
        
        HTNetwork.requestGetData(URLString: urlStr) { (result, error) in
            
            if error != nil{
                let alert = UIAlertController.init(title: HTAlertTitle, message: nil, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction.init(title: HTAlertOkTitle, style: UIAlertAction.Style.cancel, handler: nil))
                alert.message = "请求失败"
                self.present(alert, animated: true, completion: nil)
            }
            else{
                
                let prodiuct = result?.kj.model(HTMainModel.self)
                print(prodiuct?.siteId)
            }
        }
    }
    
    override func createUI() {
        
        super.createUI()
        title = "Swift练习册";
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 60
        tableView?.sectionHeaderHeight = 0
        tableView?.sectionFooterHeight = 16
    }
    
    override func createLayouts() {
        
        super.createLayouts()
    }
    
    //MARK:UITableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //??空合运算符会自动拆包，如果值为nil则用？？后面的值来赋值
        let cell:HTMainCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HTMainCell ?? HTMainCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        
        let model = dataArr[indexPath.section][indexPath.row]
        
        cell.titleLab?.text = model["title"]
        cell.classLab?.text = model["class"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        gotoVC(indexPath)
    }
    
    //MARK:Action
    func gotoVC(_ indexPath:IndexPath) -> Void {
        
        let model = dataArr[indexPath.section][indexPath.row]

        guard let classStr = model["class"] else {
            return
        }
        
        let alert = UIAlertController.init(title: HTAlertTitle, message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction.init(title: HTAlertOkTitle, style: UIAlertAction.Style.cancel, handler: nil))
        
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            alert.message = "没有命名空间"
            present(alert, animated: true, completion: nil)
            return
        }
        
        guard let classOfVC = NSClassFromString(nameSpace + "." + classStr) else {
            
            alert.message = "没有获取到字符串对应的Class"
            present(alert, animated: true, completion: nil)
            return
        }
        
        guard let classTypeOfVC = classOfVC as? UIViewController.Type else {
            alert.message = "没有获取对应控制器的类型"
            present(alert, animated: true, completion: nil)
            return
        }
        
        let vc = classTypeOfVC.init()
        navigationController?.pushViewController(vc, animated: true)
    }

}
