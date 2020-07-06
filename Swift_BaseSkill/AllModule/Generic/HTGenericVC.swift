//
//  HTGenericVC.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/7/6.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import UIKit


/// 用数组实现栈
struct IntStack {
    var items = [Int]()
//    var item1:Array<Int> = Array<Int>()
    mutating func push(_ item:Int){
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct elementStack<T> {
    var items = [T]()
//    var item1:Array<T> = Array<T>()
    mutating func push(_ item:T){
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

extension elementStack{
    
    var topItem:T?{
        return items.isEmpty ? nil : items[items.count]
    }
    
}

protocol Shape {
    func draw() -> String
}

struct Triangle:Shape {
    
    var size:Int
    func draw() -> String {
        var result = [String]()
        for length in 1...size{
            result.append(String(repeating: "#", count: length))
        }
        
        return result.joined(separator: "\n")
    }
}

struct FlippedShape<T:Shape>:Shape {
    var shape:T
    func draw() -> String {
        
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

struct combineShape<T:Shape,U:Shape>:Shape {
    
    var topShape:T
    var bottomShape:U
    
    func draw() -> String {
        return topShape.draw() + "\n" + bottomShape.draw()
    }
}

class HTGenericVC: HTBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        test1()
        test2()
    }
    
    override func createUI() {
        super.createUI()
        title = "泛型和不透明类型"
    }

    func findIndex<T:Equatable>(item:T,from arr:[T]) -> Int? {
        
        for (index,value) in arr.enumerated() {
            
            if value == item {
                return index
            }
        }
        
        return nil
    }
    
    func test2() -> Void {
        let tess = Triangle(size: 5)
//        print(tess.draw())
        
        let tes3 = FlippedShape(shape: tess)
//        print(tes3.draw())
  
        let tesft = combineShape(topShape: tess, bottomShape: tes3)
        print(tesft.draw())
    }
    
    func test1() -> Void {
        
        var someInt = 3
        var anotherInt = 107
        
        swapTwoInts(&someInt, &anotherInt)
        
        var someStr = "3"
        var anotherStr = "107"
        swapTwoStrings(&someStr, &anotherStr)
        
        swapTwoValues(&someInt, &anotherInt)
        swapTwoValues(&someStr, &anotherStr)

    }
    
    func swapTwoInts(_ a: inout Int,_ b: inout Int) {
        let tempVar = a
        a = b
        b = tempVar
    }
    
    func swapTwoStrings(_ a: inout String,_ b: inout String) {
        let tempVar = a
        a = b
        b = tempVar
    }
    
    func swapTwoValues<Tea>(_ a: inout Tea,_ b: inout Tea) -> Void {
        let tempVar = a
        a = b
        b = tempVar
    }
}
