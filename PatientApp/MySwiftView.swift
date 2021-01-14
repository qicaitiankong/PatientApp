//
//  MySwiftView.swift
//  PatientApp
//
//  Created by Lizihao Li on 2021/1/10.
//

import UIKit

class MySwiftView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
