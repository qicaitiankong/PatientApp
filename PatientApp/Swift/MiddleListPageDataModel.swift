//
//  MiddleListPageDataself.swift
//  tabbarExercises
//
//  Created by Lizihao Li on 2021/1/6.
//  Copyright © 2021 Lizihao Li. All rights reserved.
//

import UIKit
import SwiftyJSON

class MiddleListPageDataModel: Codable
{
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
    
    
    func setNeedValue() {
         self.imageUrlStr = "http://47.104.255.147:8089/LinPic/" + self.headImg!
                    self.topTitleStr = "测试label文字字自适应能力而已" + self.imageUrlStr!
                    
        //            self.nickNameStr = dict["nickname"].stringValue
        //            self.incomeStr = dict["incom"].stringValue
               
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


