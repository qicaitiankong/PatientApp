//
//  TestSwift.swift
//  PatientApp
//
//  Created by Lizihao Li on 2021/1/9.
//

import Foundation

/*
 @objcMembers
 
 在类名前面是使用objcMembers修饰，系统会在自动给这个类的所有方法添加@objc，暴露给OC。
 
 */

//  class TestSwift: NSObject{
//    //可选类型oc无法调用
//    public var nameSwift: String?
//
//    @objc var age = 2
//
//    @objc var birthday: String = "1993.12.15"
//
//    public override init() {
//        self.nameSwift = "lzh"
//    }
//
//    @objc func show() {
//        print("测试oc调用swift")
//    }
//    //swift 调oc
//    let tabarVC = PLTabbarController()
//}
@objcMembers class TestSwift: NSObject{
    //可选类型oc无法调用
    public var nameSwift: String?

    var age = 2

    var birthday: String = "1993.12.15"

    public override init() {
        self.nameSwift = "lzh"
    }

    func show() {
        print("测试oc调用swift")
    }
    //swift 调oc
    let tabarVC = PLTabbarController()
}

// class TestSwift: NSObject{
//    //可选类型oc无法调用
//    public var nameSwift: String?
//
//     var age = 2
//
//    var birthday: String = "1993.12.15"
//
//    public override init() {
//        self.nameSwift = "lzh"
//    }
//
//    func show() {
//        print("测试oc调用swift")
//    }
//    //swift 调oc
//    let tabarVC = PLTabbarController()
//}
