//
//  SwiftVC.swift
//  PatientApp
//
//  Created by Lizihao Li on 2021/1/10.
//

import UIKit
import Alamofire
import SwiftyJSON


struct ListDataRequestParam: Encodable{
    let userId:Int
    let page: Int
    let type: Int
}



class SwiftVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    var pageNumber = 1
    var isRefresh = true
    var tableView: UITableView?
    lazy var modelArr: [ZhDetailModel] = []
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad()
      {
          super.viewDidLoad()
          self.view.backgroundColor = UIColor.white
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableViews), name: NSNotification.Name("refreshTable"), object: MiddleDetailViewController.self)
          startWebListening()
          addTableView()
          self.tableView?.mj_header?.beginRefreshing()
        //MiddleDetailViewController.test2()
      }
    
    @objc func reloadTableViews() {
        
        DispatchQueue.main.async {
            self.tableView?.reloadData()

        }
    }
    
    
    func addTableView() {
           self.tableView = UITableView(frame: CGRect(x: 0, y: GET_NAVGATION_HEIGHT(), width: SCREEN_WIDTH, height: IPHONE_VIEW_HEIGHT_ONLY_NAVIGATION), style: .plain)
           self.tableView?.backgroundColor = UIColor.white
           self.tableView?.tableFooterView = UIView.init(frame: CGRect.zero)
           self.tableView?.delegate = self
           self.tableView?.dataSource = self
           self.view.addSubview(self.tableView!)
           
           let refreshHeader = MJRefreshNormalHeader()
           refreshHeader.setRefreshingTarget(self, refreshingAction: #selector(self.startRefresh))
           self.tableView?.mj_header = refreshHeader
          
           let refreshFooter = MJRefreshAutoNormalFooter()
           refreshFooter.setRefreshingTarget(self, refreshingAction: #selector(self.startLoading))
           self.tableView?.mj_footer = refreshFooter
           
       }
    
   @objc func startRefresh() {
    print("刷新通知");
          pageNumber = 1
          isRefresh = true
          requestData(page: pageNumber)
      }
      @objc func startLoading() {
          pageNumber += 1
          isRefresh = false
          requestData(page: pageNumber)
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
      {
          return self.modelArr.count
      }
      
      func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
      {
          if indexPath.row < self.modelArr.count{
              let model = self.modelArr[indexPath.row]
              return model.cellHeight
          }
          return 0
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cellFlag = "cell"
          if let cell = tableView.dequeueReusableCell(withIdentifier: cellFlag)
          {
              let targetCell: MiddleListTableViewCell = cell as! MiddleListTableViewCell
              if indexPath.row < self.modelArr.count
              {
                  targetCell.model = self.modelArr[indexPath.row]
                  targetCell.setDataToView()
              }
              return cell
          }else
          {
              let cell = MiddleListTableViewCell.init(style: .default, reuseIdentifier: cellFlag)
              cell.selectionStyle = .none
              if indexPath.row < self.modelArr.count
              {
                  cell.model = self.modelArr[indexPath.row]
                  cell.setDataToView()
              }
              return cell
          }
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
      {
          let detailVC = MiddleDetailViewController()
          //detailVC.myDelagate = self
          //将函数地址赋给闭包变量
          //detailVC.refreshPageListClosure = startRefresh
          
          detailVC.hidesBottomBarWhenPushed = true
          self.navigationController?.pushViewController(detailVC, animated: true)
      }

   @objc func requestData(page:Int){
    
        let urlString = "http://47.104.255.147:8089/SMBMS/marry/myCollects"
        let param = ListDataRequestParam(userId: 162, page: page, type: 1)
        SVProgressHUD .show()
        AF.request(urlString,
                   method: .post,
                   parameters:param,
                   encoder: URLEncodedFormParameterEncoder.default)
            .responseData(completionHandler: { (response) in
                //主线程
                SVProgressHUD.dismiss()
                self.dealData(data: response.data, err: response.error)
        })
        
    }
    
    func dealData(data: Data?,err: Error?) ->Void {
        
        if let error = err
        {
            print(error.localizedDescription)
            endRefreshOrLoad()
        }else
        {
            if isRefresh
            {
                self.tableView?.mj_footer?.resetNoMoreData()
                self.tableView?.mj_header?.endRefreshing()
                self.modelArr.removeAll()
            }
            //数据总页数
           var totoalPage:Int?
           if let totalModel = getTotalModel(data: data)
           {
               totoalPage = totalModel.data?.totalPage
           }
           
            if isRefresh
            {
                refreshTableViewForRefresh()
            }else
            {
                    if let localTotalPage = totoalPage
                    {
                        //当前页数大于总页数
                        if self.pageNumber > localTotalPage
                        {
                            endRefreshWhenNoDataForLoad()
                        }else
                        {
                             endRerenshWhenHaveDataForLoad()
                             self.tableView?.reloadData()
                        }
                    }else
                    {
                        if self.pageNumber > 1
                        {
                            self.pageNumber -= 1
                        }
                        self.tableView?.mj_footer?.endRefreshing()
                    }
            }
        }
    }
    
    /// 上拉没数据复位页数并停止刷新
       func endRefreshWhenNoDataForLoad()
       {
            if isRefresh == false
            {
                   self.tableView?.mj_footer?.endRefreshingWithNoMoreData()
                   if self.pageNumber > 1
                   {
                        self.pageNumber -= 1
                   }
           }
       }
       
       /// 上拉有数据停止加载
       func endRerenshWhenHaveDataForLoad()  {
           if isRefresh == false
            {
                   self.tableView?.mj_footer?.endRefreshing()
           }
       }
       
       /// 停止刷新或加载
       func endRefreshOrLoad() {
           if isRefresh == false
           {
               self.tableView?.mj_footer?.endRefreshing()
           }else
           {
               self.tableView?.mj_header?.endRefreshing()
           }
       }
       
       //下拉刷新页面
       func refreshTableViewForRefresh()  {
           if isRefresh == true
            {
               self.tableView?.reloadData()
           }
       }
       
    
    /// 用类作为数据模型
    /// - Parameter data: <#data description#>
    /// - Returns: <#description#>
//    func getTotalModel(data:Data?) -> CompleteDataModel?{
//        var totalModel:CompleteDataModel?
//        if let targetData = data
//               {
//                   let decoder = JSONDecoder()
//                    totalModel = try? decoder.decode(CompleteDataModel.self, from: targetData)
//                   if let totalDataModel = totalModel
//                   {
//                       if let status = totalDataModel.status
//                       {
//                           if status == 0
//                           {
//                               if let modelArr = totalDataModel.data?.list
//                               {
//                                        for model in modelArr
//                                   {
//                                       model.setNeedValue()
//                                       self.modelArr.append(model)
//                                   }
//                               }
//                           }
//                       }
//                   }
//        }
//        return totalModel
//    }
    
    /// 用结构体作为数据模型
    /// - Parameter data: <#data description#>
    /// - Returns: <#description#>
    func getTotalModel(data:Data?) -> ZhTotalDataModel?{
        var totalModel:ZhTotalDataModel?
        if let targetData = data
               {
                   let decoder = JSONDecoder()
                    totalModel = try? decoder.decode(ZhTotalDataModel.self, from: targetData)
                   
                   if let totalDataModel = totalModel
                   {
                       if let status = totalDataModel.status
                       {
                           if status == 0
                           {
                               if let modelArr = totalDataModel.data?.list
                               {
                                        for model in modelArr
                                   {
                                       var targetModel = model
                                       targetModel.setNeedValue()
                                       self.modelArr.append(targetModel)
                                   }
                               }
                           }
                       }
                   }
        }
        return totalModel
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
}
