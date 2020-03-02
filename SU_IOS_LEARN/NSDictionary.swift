//
//  NSDictionary.swift
//  SU_IOS_LEARN
//
//  Created by AI Apple on 2/3/2563 BE.
//  Copyright © 2563 siamu. All rights reserved.
//

import Foundation
extension NSDictionary{
    
    public func isNotNull(_ aKey : String) -> Bool {
        
        if let value = self.object(forKey: aKey) {
            return true
        }
        return false
    }
    
    public func stringWithKey(_ aKey : String) -> String {
           if isNotNull(aKey) {
               if self[aKey] is NSNull {
                   return ""
               }
               if self[aKey] is String {
                   return self[aKey] as! String
               }
               
           }
           return ""
       }
}
