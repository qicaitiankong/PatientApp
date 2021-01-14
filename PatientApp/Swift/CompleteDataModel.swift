//
//  CompleteDataModel.swift
//  PatientApp
//
//  Created by Lizihao Li on 2021/1/14.
//

import Foundation

class CompleteDataModel: Codable {
    var status: Int?
    var data:DataModel?
    var msg: String?
    
    enum CodingKeys:String,CodingKey {
        case status,data,msg
    }
    
}
