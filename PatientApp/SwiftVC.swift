//
//  SwiftVC.swift
//  PatientApp
//
//  Created by Lizihao Li on 2021/1/10.
//

import UIKit
import Alamofire
import SwiftJSONi

struct ListDataRequestParam: Encodable{
    let userId:Int
    let page: Int
    let type: Int
}



class SwiftVC: UIViewController
{
    override func viewDidLoad()
      {
          super.viewDidLoad()
          self.view.backgroundColor = UIColor.gray
          startWebListening()
      }
    //实时监测
    func startWebListening() {
        
        let reach = Reachability.forInternetConnection()
        reach?.reachableBlock = { reachability in
            switch reachability?.currentReachabilityStatus() {
            case .none:
                SVProgressHUD.showInfo(withStatus: "未知网络")
            case .NotReachable:
                 SVProgressHUD.showInfo(withStatus: "网络未连接")
            case .ReachableViaWiFi:
                  print("wifi")
            case .ReachableViaWWAN:
                print("4G")
            case .some(_):
                print("网络其他问题")
            }
        }
        reach?.startNotifier()
        
    }
    //只能单次监测，不能实时
    func getWebState() {
        let manager = NetworkReachabilityManager(host: "www.apple.com")
        manager?.startListening(onUpdatePerforming: { (status) in
            switch status{
            case .unknown:
                SVProgressHUD.showInfo(withStatus: "未知网络")
                print("未知网络")
            case .notReachable:
                SVProgressHUD.showInfo(withStatus: "网络未连接")
                print("网络未连接")
            case .reachable(.cellular):
                print("移动数据")
            case .reachable(.ethernetOrWiFi):
                print("wifi连接")
            }
        })
        
    }

   @objc func requestData() {
    
        
        let urlString = "http://47.104.255.147:8089/SMBMS/marry/myCollects"
        let param = ListDataRequestParam(userId: 162, page: 1, type: 1)
        SVProgressHUD .show()
        AF.request(urlString,
                   method: .post,
                   parameters:param,
                   encoder: URLEncodedFormParameterEncoder.default)
            .responseData(completionHandler: { (response) in
                SVProgressHUD.dismiss()
                if let err = response.error
                {
                    if let code =  err.responseCode
                    {
                        print("请求失败返回码：\(code)")
                    }
                }else
                {
                    if let responseJson = JSON.init(data: response.data)
                     {
                        print(responseJson.dictionaryValue)
                    }
                }
        })
                
                
       
//        AF.request(urlString).validate().responseJSON { response in
//
//           }
        
    }
    
}
