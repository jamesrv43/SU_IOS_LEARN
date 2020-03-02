//
//  APIRequest.swift
//  SU_IOS_LEARN
//
//  Created by AI Apple on 2/3/2563 BE.
//  Copyright © 2563 siamu. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

private let _sharedInstance = APIRequest()

let GET_EMPLOYEE_LIST = "GET_EMPLOYEE_LIST"

let getUsersList = "https://reqres.in/api/users"

class APIRequest{
    
    class var sharedInstance: APIRequest {
        
        return _sharedInstance
    }
    
    func getEmployeeList(){
        Alamofire.request(getUsersList, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseData{
            response in
            if response.result.isSuccess {
                
                do {
                    let jsonResult  = try JSONSerialization.jsonObject(with: response.result.value!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    let dict : NSDictionary = jsonResult
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: GET_EMPLOYEE_LIST), object: nil, userInfo: ["status" :"S", "result" : dict["data"] as! NSArray ])
                    
                } catch let error as NSError {
                    print(error)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: GET_EMPLOYEE_LIST), object: nil, userInfo: ["status" :"E", "result" : error.localizedDescription])
                }
            }
        }
        .responseJSON { response in
            switch response.result {
            case .success:
                print("Validation Successful getEmployeeList")
                break
            case .failure(let error):
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: GET_EMPLOYEE_LIST), object: nil, userInfo: ["status" :"E", "result" : error.localizedDescription])
                
                print("failure getEmployeeList : \(error)")
                
                break
                
            }
        }
        
    }
    
}
