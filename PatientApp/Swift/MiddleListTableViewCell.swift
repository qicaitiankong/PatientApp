//
//  MiddleListTableViewCell.swift
//  tabbarExercises
//
//  Created by Lizihao Li on 2021/1/6.
//  Copyright © 2021 Lizihao Li. All rights reserved.
//

import UIKit

class MiddleListTableViewCell: UITableViewCell {
    
    var model: MiddleListPageDataModel?
    var topImageView: UIImageView?
    var topTitleLabe: UILabel?
    var nickNameLab: UILabel?
    var incomeLabe: UILabel?
    
    /// 界面赋值
    func setDataToView() {
       
        if let imageUrlStr = model?.imageUrlStr
        {
            if let imageUrl = URL(string: imageUrlStr)
            {
                self.topImageView?.sd_setImage(with: imageUrl, placeholderImage: nil, options: .progressiveLoad, context: nil, progress: nil, completed: { (image, error, cacheType, url) in
                })
            }
        }
        if let topTitle = model?.topTitleStr
        {
            self.topTitleLabe?.text = topTitle
        }
        if let nickName = model?.nickNameStr{
            self.nickNameLab?.text = nickName
        }
        if let incomeStr = model?.incomeStr
        {
            self.incomeLabe?.text = incomeStr
        }
        
        self.topTitleLabe?.mas_updateConstraints({ (make) in
            make?.height.mas_equalTo()(model?.titleHeight)
        })

        self.nickNameLab?.mas_updateConstraints({ (make) in
                  
            make?.top.mas_equalTo()(self.topTitleLabe?.mas_bottom)?.offset()(10)
        })

       self.incomeLabe?.mas_updateConstraints({ (make) in
           make?.top.mas_equalTo()(self.nickNameLab)
       })
    }
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.topImageView = UIImageView.init()
        self.topImageView?.backgroundColor = UIColor.gray
        self.topImageView?.contentMode = .scaleAspectFit
        self.topTitleLabe = UILabel.init()
        self.topTitleLabe?.font = UIFont.systemFont(ofSize: 16)
        self.topTitleLabe?.numberOfLines = 0
        self.nickNameLab = UILabel.init()
        self.nickNameLab?.font = UIFont.systemFont(ofSize: 14)
        self.incomeLabe = UILabel.init()
        self.incomeLabe?.font = UIFont.systemFont(ofSize: 12)
        
        self.contentView.addSubview(self.topImageView!)
        self.contentView.addSubview(self.topTitleLabe!)
        self.contentView.addSubview(self.nickNameLab!)
        self.contentView.addSubview(self.incomeLabe!)
        // 10 + 50
        self.topImageView?.mas_makeConstraints({ (make) in
            //swift 中不允许这样写，隐性解包报错
            //make?.left.mas_equalTo()(self.contentView)?.mas_offset()(10)
            //可以这样写
            //make?.left.mas_equalTo()(self.contentView)?.offset()(10)
            //也可以这样写
            make?.left.offset()(10)
            make?.top.mas_equalTo()(self.contentView.mas_top)?.offset()(10)
            make?.width.mas_equalTo()(50)
            make?.height.mas_equalTo()(50)
        })
        //
        self.topTitleLabe?.mas_makeConstraints({ (make) in
            make?.left.mas_equalTo()(self.topImageView?.mas_right)?.offset()(10)
            make?.right.mas_equalTo()(self.contentView.mas_right)?.offset()(-10)
            make?.top.mas_equalTo()(self.topImageView)
            make?.height.mas_equalTo()(5)
        })

        self.nickNameLab?.mas_makeConstraints({ (make) in
            make?.left.mas_equalTo()(self.topTitleLabe)
            make?.width.mas_equalTo()(100)
            make?.top.mas_equalTo()(self.topTitleLabe?.mas_bottom)?.offset()(10)
            make?.height.mas_equalTo()(10)
        })

        self.incomeLabe?.mas_makeConstraints({ (make) in
            make?.left.mas_equalTo()(self.nickNameLab?.mas_right)?.offset()(15)
            make?.right.mas_equalTo()(self.topTitleLabe?.mas_right)

            make?.top.mas_equalTo()(self.nickNameLab)
            make?.height.mas_equalTo()(self.nickNameLab)
        })
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
