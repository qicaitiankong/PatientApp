//
//  ConstantsHeader.swift
//  tabbarExercises
//
//  Created by Lizihao Li on 2021/1/5.
//  Copyright © 2021 Lizihao Li. All rights reserved.
//

import UIKit

/// 屏宽
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
/// 屏高
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
/// 有导航状态和标签栏时的中间view高度
let IPHONE_CENTER_VIEW_HEIGHT = SCREEN_HEIGHT - GET_NAVGATION_HEIGHT() - GET_TABBAR_HEIGHT()

/// 只有导航栏无标签栏时view高度
let IPHONE_VIEW_HEIGHT_ONLY_NAVIGATION = SCREEN_HEIGHT - GET_NAVGATION_HEIGHT()

/// 判断是否是iphone
/// - Returns: Bool
func IS_IPHONE() -> Bool
{
    if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    {
        return true
    }else{
        return false
    }
}

/// 判断是否是竖屏
/// - Returns: Bool
func IS_VERTICAL_SCREEN() -> Bool {
    if SCREEN_HEIGHT > SCREEN_WIDTH {
        return true
    }else{
        return false
    }
}

/// 是否是iphoneX 系列
/// - Returns:  Bool
func IS_IPHONE_X_ALL() -> Bool
{
    if IS_IPHONE() && IS_VERTICAL_SCREEN()
    {
        if SCREEN_HEIGHT == 812 || SCREEN_HEIGHT == 896
        {
            return true
        }else
        {
            return false
        }
    }
    return false
}

/// 导航栏高度(包括状态栏在内)
/// - Returns: CGFloat
func GET_NAVGATION_HEIGHT() -> CGFloat{
    if IS_IPHONE_X_ALL()
    {
        return 88
    }else{
        return 64
    }
}

/// 获取状态栏高度
/// - Returns: CGFloat
func GET_STATUSBAR_HEIGHT() -> CGFloat {
    if IS_IPHONE_X_ALL()
    {
        return 44
    }else{
        return 20
    }
}

/// 底部标签栏高度
/// - Returns: CGFloat
func GET_TABBAR_HEIGHT() -> CGFloat {
    if IS_IPHONE_X_ALL()
    {
        return 83
    }else{
        return 49
    }
}

/// 底部安全区域高度
/// - Returns: CGFloat
func GET_SAFEBOTTOMAREA_HEIGHT() -> CGFloat {
    if IS_IPHONE_X_ALL()
    {
        return 34
    }else{
        return 0
    }
}

/// 顶部传感器高度
/// - Returns: CGFloat
func GET_TOPSENSOR_HEIGHT_HEIGHT() -> CGFloat {
    if IS_IPHONE_X_ALL()
    {
        return 32
    }else{
        return 0
    }
}

/// 解包可选字符串，若无值返回空字符串""
/// - Parameter optinalStr: 可选字符串
/// - Returns: description
func getStringValueOfOptionalStringZH(optinalStr:String?) -> String {
    if let str = optinalStr
    {
        return str
    }else
    {
        return ""
    }
}


//数据模型
struct ZhTotalDataModel:Codable {
    var status: Int?
    var data:ZhDataModel?
    var msg: String?
    
}

struct ZhDataModel:Codable {
    var list:[ZhDetailModel]?
    var pageSize: Int?
    var totalPage: Int?
    
}

struct ZhDetailModel:Codable{
    //接口原始字段，如果和接口原始字段不一致，可以通过下面方式设置
    var nickNameStr: String?

    var incomeStr: String?
    
    var headImg: String?
    //自定义字段
    var titleHeight: CGFloat = 0
    var cellHeight: CGFloat = 0
    
    var imageUrlStr: String?

    var topTitleStr: String?
    
    /*以上是自定义的属性，如果和后台字段不一致，需要设置CodingKeys枚举,并且遵守String,CodingKey，记住一旦写了枚举，需要把所有自动解析的属性都写在里面;
     如果和后台一样，是不需要设置该枚举的
 */
    enum CodingKeys: String,CodingKey{
        case nickNameStr = "nickname"
        case incomeStr = "incom"
        case headImg
    }
    
    mutating func setNeedValue() {
        let imageStr = getStringValueOfOptionalStringZH(optinalStr: self.headImg)
        self.imageUrlStr = "http://47.104.255.147:8089/LinPic/" + imageStr
        self.topTitleStr = "测试label文字字自适应能力而已" + self.imageUrlStr!
        
 
        if let titleHeight =   self.topTitleStr?.getHeightWith(UIFont.systemFont(ofSize: 16), width:SCREEN_WIDTH - 80)
            {
             self.titleHeight = titleHeight
            }
            if self.titleHeight + 20 <= 50
            {
                self.cellHeight = 70
            }else
            {
                self.cellHeight = 10 + self.titleHeight + 20 + 10
            }
    }
}
