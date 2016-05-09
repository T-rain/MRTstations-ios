//
//  MRTdata.swift
//  MRTstations-ios
//
//  Created by huang tsun yu on 2016/5/9.
//  Copyright © 2016年 huang tsun yu. All rights reserved.
//

import Foundation
import SwiftyJSON

/*
struct MRTStation{
    
    var stationName:String
    var line:Array<MRTLine>

}
*/


struct MRTLine{
    var lineName:String
    var lineStationCount:Int
}

struct MRTdata{
    
    private var dataArray: Array<Array<JSON>> = []
    private var lineArray: [MRTLine] = []
    private let lineDictionary = ["文湖線":UIColor(red: 158/255, green:101/255, blue: 46/255, alpha: 1.0),
                                  "淡水信義線":UIColor(red: 203/255, green:44/255, blue: 48/255, alpha: 1.0),
                                  "新北投支線":UIColor(red: 248/255, green:144/255, blue: 165/255, alpha: 1.0),
                                  "松山新店線":UIColor(red: 0/255, green:119/255, blue: 73/255, alpha: 1.0),
                                  "小碧潭支線":UIColor(red: 206/255, green:220/255, blue: 0/255, alpha: 1.0),
                                  "中和新蘆線":UIColor(red: 255/255, green:163/255, blue: 0/255, alpha: 1.0),
                                  "板南線":UIColor(red: 0/255, green:94/255, blue: 184/255, alpha: 1.0),
                                  "貓空纜車":UIColor(red: 119/255, green:185/255, blue: 51/255, alpha: 1.0)]
    
    
    init(){
        let path = NSBundle.mainBundle().pathForResource("MRT", ofType: "json")!
        let jsonData = NSData(contentsOfFile: path)!
        
        let json = JSON(data: jsonData)
        let list = json.arrayValue
        
        
        let lineNameArray = Array(lineDictionary.keys)
        lineNameArray.forEach({print($0)})
        
        let brStationArray = list.filter({$0["lines"]["文湖線"].string != nil })
        let brline = MRTLine(lineName: "文湖線",lineStationCount:  brStationArray.count)
        
        lineArray.append(brline)
        print(lineArray[0])
        dataArray.append(brStationArray)
        print(dataArray[0][0])
    }
    
    func getData() -> Array<Array<JSON>>{
        return dataArray
    }
    
    
    func getLine() -> Array<MRTLine>{
        return lineArray
    }
    
}





