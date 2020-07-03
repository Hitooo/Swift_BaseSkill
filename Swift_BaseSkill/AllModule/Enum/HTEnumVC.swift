//
//  HTEnumVC.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/7/3.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import UIKit

class HTEnumVC: HTBaseVC {

    enum DirectionType {
        case north
        case south
        case east
        case west
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let type = DirectionType.east

        test1(type: type)
    }
    
    override func createUI() {
        
        super.createUI()
        title = "枚举"
    }

    func test1(type:DirectionType) -> Void {

        switch type {
        case .east:
            print("Mostly harmless1")
        case .south:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
        
    }
}
