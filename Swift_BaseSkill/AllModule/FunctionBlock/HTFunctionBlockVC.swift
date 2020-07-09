//
//  HTFunctionBlockVC.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/7/2.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import UIKit

class HTFunctionBlockVC: HTBaseVC {

    var someClosure:((String,String) -> Bool)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test1()
        let hitoo = test3(amount: 5)
        let _ = hitoo()
        let _ = hitoo()

        test2()
        
        someClosure = backwardWithPrint(_:_:)
        
        someClosure = {
            (p1,p2) -> Bool in
                return false
            }
        }
    }
    
    func test1() {
        
        //把定义好的函数作为参数传给sorted
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
//        (s1:String, s2:String) -> Bool { return s1 < s2 }
        let reversedName6 = names.sorted(by: backward)
        _ = names.sorted(by: { (s1, s2) -> Bool in s1 < s2 })
        let reversedName2 = names.sorted { (s1:String, s2:String) -> Bool in return s1 < s2 }
        let reversedName1 = names.sorted() { s1, s2 in s1 > s2 }
        let reversedName3 = names.sorted { $0 < $1 }
        let reversedName4 = names.sorted(by: >)

        print(reversedName6)
        
        //闭包完整的形式
       
        print(reversedName2)
        
        //函数体如果就一行代码，那么return关键词也是可以省略的
        //参数以及返回值的类型定义也是可以省略的
        //参数的括号都可以省略
        print(reversedName1)
        
        print(reversedName3)
        
        print(reversedName4)
    }
    
    func test2() {
        
        //嵌套函数
        func someFunc(name:String, closure:(String,String) -> Bool){
            print(name)
        }
        
        someFunc(name: "你好呀", closure: { (s1, s2) -> Bool in s1 > s2})
        
        //尾随闭包是一个书写在函数圆括号之后的闭包表达式，函数支持将其作为最后一个参数调用
        someFunc(name: "你好呀") { (s1, s2) -> Bool in
            s1 > s2
        }
    }
    
    func backwardWithPrint(_ s1:String,_ s2:String) -> Bool {
        
        print("\nbackward")
        return s1 > s2
    }
    
    func backward(_ s1:String,_ s2:String) -> Bool {
        s1 > s2
    }
    
    func test3(amount:Int) -> () -> Int {
        
        var total = 0
        
        func increaseMent() -> Int{
            total += amount
            return total
        }
        
//        total += 16
        return increaseMent
    }
}
