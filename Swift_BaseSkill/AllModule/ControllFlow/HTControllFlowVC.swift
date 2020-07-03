//
//  HTControllFlowVC.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/7/2.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import UIKit

class HTControllFlowVC: HTBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        test1()
        let _ = test2(name: "Jack")
        let _ = test3("Rose")
        let _ = test4(for: "Simon")
    }

    override func createUI() {
        
        super.createUI()
        title = "控制流"
    }
    
    func test1() -> Void {
        
        let base = 3
        let power = 10
        var answer = 1
        
        for _ in 1...power {
            answer *= base
        }
        
        print("\(base) to the power of \(power) is \(answer)")
        
        for tickMark in stride(from: 0, to: 60, by: 5) {
            // 每5分钟渲染一个刻度线（0, 5, 10, 15 ... 45, 50, 55）
            print("每5分钟渲染一个刻度线: \(tickMark)")
        }
    }
    
    func test2(name:String) -> String {
        return "Hello" + name
    }
    
    func test3(_ name:String) -> String {
        return "Hello" + name
    }
    
    //如果一个函数的整个函数体是一个单行表达式，这个函数可以隐式地返回这个表达式
    //任何一个可以被写成一行 return 语句的函数都可以忽略 return
    func test4(for name:String) -> String {
        "Hello" + name
    }
}
