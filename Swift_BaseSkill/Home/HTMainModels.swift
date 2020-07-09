//
//  HTMainModels.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/7/7.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import UIKit

class Iosupdateinfo:HTBaseModel {
    var desc: String?
    var vcforce: String?
    var forceupdate: String?
    var versionName: String?
}

class Androidupdateinfo:HTBaseModel {
    var downlink: String?
    var desc: String?
    var vcforce: String?
    var forceupdate: String?
    var versioncode: String?
    var versionname: String?
}

class Data:HTBaseModel {
    var iosupdateinfo: Iosupdateinfo?
    var androidupdateinfo: Androidupdateinfo?
}

class HTMainModel:HTBaseModel {
    var pageId: Int = 0
    var data: Data?
    var start: Int = 0
    var expires: Int = 0
    var code: Int = 0
    var message: String?
}
