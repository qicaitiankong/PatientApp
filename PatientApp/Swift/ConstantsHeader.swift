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


