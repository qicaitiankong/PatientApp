//
//  MiddleDetailViewController.swift
//  tabbarExercises
//
//  Created by Lizihao Li on 2021/1/8.
//  Copyright © 2021 Lizihao Li. All rights reserved.
//

import UIKit

protocol MakeDetailPageWorkSomethingProtocol:AnyObject{
       
    //协议中的属性必须指定可读或可读可写
    var num: Int{get}
    var num2: String{get set}
    func giveValue()
       
}

class MiddleDetailViewController: UIViewController{
    
    weak var myDelagate: MakeDetailPageWorkSomethingProtocol?
    //闭包类型变量
    
    var refreshPageListClosure: (() -> Void)?
    //也可以先起个类型别名，再定义
    //    typealias RefreshPageListClosure = () -> Void
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let button: UIButton = UIButton()
        button.backgroundColor = UIColor.gray
        button.addTarget(self, action: #selector(clickButtonHandler(b:)), for: .touchUpInside)
        button.setTitle("刷新列表", for: .normal)
        self.view.addSubview(button)
        button.mas_makeConstraints { (make) in
            make?.left.mas_equalTo()(20)
            make?.top.mas_equalTo()(50)
            make?.width.mas_equalTo()(100)
            make?.height.mas_equalTo()(50)
        }
        
    }
    
    @objc func clickButtonHandler(b:UIButton)
    {
        //检查是否遵守协议,再执行
//        if let delegate = self.myDelagate
//        {
//            delegate.giveValue()
//            self.navigationController?.popViewController(animated: true)
//        }
        
        //闭包方式
//        if let refreshClosure = refreshPageListClosure
//        {
//            self.navigationController?.popViewController(animated: true)
//            //调用闭包函数
//            refreshClosure()
//        }
        
        //测试异步通知，得到 结果：通知接受者所执行的方法执行的线程是在 通知发送方所在的线程，所以异步通知执行的方法刷新UI 需要回到主线程
        DispatchQueue.global().async {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshTable"), object: MiddleDetailViewController.self, userInfo: nil)

        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
   

}

