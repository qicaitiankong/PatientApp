//
//  MiddleListPageDataself.swift
//  tabbarExercises
//
//  Created by Lizihao Li on 2021/1/6.
//  Copyright © 2021 Lizihao Li. All rights reserved.
//

import UIKit
import SwiftyJSON

class MiddleListPageDataModel
{
    var titleHeight: CGFloat = 0
    var cellHeight: CGFloat = 0
    
    var imageUrlStr: String?

    var topTitleStr: String?

    var nickNameStr: String?

    var incomeStr: String?
    
    init(dict:JSON)
    {
        
            self.imageUrlStr = "http://47.104.255.147:8089/LinPic/" + dict["headImg"].stringValue
            self.topTitleStr = "测试label文字字自适应能力而已" + self.imageUrlStr!
            
            self.nickNameStr = dict["nickname"].stringValue
            self.incomeStr = dict["incom"].stringValue
       
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


