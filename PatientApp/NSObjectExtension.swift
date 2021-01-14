//
//  NSObjectExtension.swift
//  tabbarExercises
//
//  Created by Lizihao Li on 2021/1/4.
//  Copyright © 2021 Lizihao Li. All rights reserved.
//

import Foundation

extension NSObject {
    
    /// 把data -> json字符串
    /// - Parameter dataInfo: data
    /// - Returns: json字符串
    func getJsonStrFromDataZH(dataInfo: Data) -> String?
    {
        return String(data:dataInfo, encoding: .utf8)
    }
    /// data -> 对象
    /// - Parameter dataInfo: data
    /// - Returns: 可选对象
    func getObjectFromDataZH(dataInfo: Data) -> Any?
     {
         return try? JSONSerialization.jsonObject(with: dataInfo, options: .mutableContainers)
     }
    
    /// json string -> object
    /// - Parameter dataInfo: json string
    /// - Returns: object
    func getObjectFromJsonStrZH(dataInfo: String) -> Any?
     {
         if let jsonData = dataInfo.data(using: .utf8)
         {
            return try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
         }else
         {
                return nil
        }
     }
    
    /// json 字符串->data
    /// - Parameter jsonStr: json 字符串
    /// - Returns: data
     func getDataFromJsonStrZH(jsonStr:String) -> Data? {
         return jsonStr.data(using: .utf8)
     }
    
    /// 对象 ->  data
    /// - Parameter obj: 对象
    /// - Returns: data
     func getDataFromObjectZH(obj: Any) -> Data?
     {
        if JSONSerialization.isValidJSONObject(obj)
        {
            return try? JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)

        }else
        {
            print("目标对象不符合JSONSerialization处理要求")
            return nil
        }
     }
    
}
