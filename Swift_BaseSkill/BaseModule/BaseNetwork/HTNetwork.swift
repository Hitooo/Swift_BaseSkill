//
//  HTNetwork.swift
//  Swift_BaseSkill
//
//  Created by haitaozhang on 2020/7/7.
//  Copyright © 2020 haitaozhang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HTNetwork {
    
    class func requestGetData(URLString : String, parameters : [String : Any]? = nil, completion : @escaping( _ result:String?,_ error:Error?) -> ()) {
        
        requestData(URLString: URLString,method: .get,parameters: parameters, completion: completion)
    }
    
    class func requestPostData(URLString : String, parameters : [String : Any]? = nil, completion : @escaping( _ result : String?,_ error:Error?) -> ()) {
        requestData(URLString: URLString,method: .post,parameters: parameters, completion: completion)
    }
    
    private class func requestData(URLString : String,method:HTTPMethod = .get, parameters : [String : Any]? = nil, completion : @escaping( _ result:String?,_ error:Error?) -> ()) {
        
        AF.request(URLString, method: method, parameters: parameters).responseString { (response) in
            completion(response.value,response.error)
        }
    }
}
