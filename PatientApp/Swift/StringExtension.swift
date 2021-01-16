//
//  StringExtension.swift
//  tabbarExercises
//
//  Created by Lizihao Li on 2021/1/7.
//  Copyright © 2021 Lizihao Li. All rights reserved.
//

import UIKit

public extension String {
    
    
    /// 网络请求参数字典拼接为 "?key=value&key2=value2...."格式
    /// - Parameter paraDict: 字典
    /// - Returns: 字符串
    mutating func getQueryUrlStrZH(paraDict:Dictionary<String,Any?>) -> Void {
       
       let keyArr = paraDict.keys.sorted()
        if keyArr.isEmpty == false
        {
            self.append("?")
        }
       for (index,key) in keyArr.enumerated()
       {
           let dictValue = paraDict[key]
           if index > 0
           {
                if let value = dictValue
                {
                    self.append("&\(key)=\(value!)")
                }
           }else
           {
                if let value = dictValue
                {
                     self.append("\(key)=\(value!)")
                }
           }
       }
    }
    
    /// 获取字符串高度(没有oc 中计算精度高)
    /// - Parameters:
    ///   - font: 字体
    ///   - labelWidth: label 宽度
    /// - Returns: height
    func getStringHeightWithFontZH(font:UIFont,labelWidth:CGFloat) -> CGFloat
    {
        let attributes = [NSAttributedString.Key.font:font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect = self.boundingRect(with: CGSize(width: labelWidth, height: 1000.0), options:option, attributes: attributes, context: nil)
        return rect.height
    }
    
    
}

