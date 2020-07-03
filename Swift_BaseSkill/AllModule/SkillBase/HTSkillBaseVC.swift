//
//  HTSkillBaseVC.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/7/1.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import UIKit

class HTSkillBaseVC: HTBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        test1()
        test2()
        test3()
    }
    
    override func createUI() {
        
        super.createUI()
        title = "我是基础部分"
        view.backgroundColor = UIColor.green
    }
    
    override func createLayouts() {
        
    }
    
    //区间运算符
    func test1() {

        for index in 1...5 {
            print("\r\n------hitoo:\(index)")
        }
        
        for index in 1..<5 {
            print("\r\n---<---hitoo:\(index)")
        }
        
        let names = ["Anna", "Alex", "Brian", "Jack"]
        
        for name in names[2...]{
            print("\r\n------hitoo:\(name)")
        }
    }
    
    //集合操作
    func test2() -> Void {
        
        let name = "DOG!🐶"
        
        for character in name {
            print("\r\n---test2---hitoo:\(character)")
        }
        
        //一个集合类型不能从数组字面量中被直接推断出来，因此 Set 类型必须显式声明
        var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
        
        //由于 Swift 的类型推断功能，如果你想使用一个数组字面量构造一个集合并且与该数组字面量中的所有元素类型相同，那么无须写出集合的具体类型
        var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]
        favoriteGenres1.insert("hitoo")
        
        favoriteGenres.remove("Rock")
        
        if favoriteGenres1.contains("Classical") {
            print("\r\n---test2---Set:Classical")
        }
        
        for item in favoriteGenres.sorted() {
            print("\(item)")
        }
    }
    
    func test3() -> Void {
        
        var namesDic = [Int:String]()
        namesDic[14] = "12345"
        namesDic = [:]

    }
}
