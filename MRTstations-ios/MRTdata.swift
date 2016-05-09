//
//  MRTdata.swift
//  MRTstations-ios
//
//  Created by huang tsun yu on 2016/5/9.
//  Copyright © 2016年 huang tsun yu. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MRTLines{
    
}

struct MRTdata{
    
    private var dataArray: [MRTLines] = []
    //let path = NSBundle
    
    
    
    func getData() -> Array<MRTLines>{
        
        return dataArray
    }
    
}





