//
//  MRTdata.swift
//  MRTstations-ios
//
//  Created by huang tsun yu on 2016/5/9.
//  Copyright © 2016年 huang tsun yu. All rights reserved.
//

import Foundation
import SwiftyJSON


struct MRTStation{
    
    var stationName:String
    var line:Array<MRTLines>

}

struct MRTLines{
    var lineName:String
    var lineStation:String
    var lineBackgroundColor:UIColor
}


struct MRTdata{
    
    private var dataArray: Array<Array<MRTStation>> = []
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
        
        //need the lineDictionary.value(color)
        for (key, _ ) in lineDictionary {
            //first,filter with lineDictionary.key("lineName")
            //then,map Array<JSON>
            let stationArray = list.filter({$0["lines"][key].string != nil }).map({(x) -> MRTStation in
                var array: Array<MRTLines> = []
                let stationLineDict:[String:JSON] = x["lines"].dictionaryValue
                
                for (skey,subjson) in stationLineDict {
                    let lines = MRTLines(lineName: skey,lineStation: subjson.string!,lineBackgroundColor: lineDictionary[skey]!)
                    array.append(lines)
                }
                let mrtstation = MRTStation(stationName:x["name"].string!,line: array )
                return mrtstation
            })
            
            dataArray.append(stationArray)
        }
        
        /*
        let stationArray = list.filter({$0["lines"]["文湖線"].string != nil }).map({(x) -> MRTStation in
            var array: Array<MRTLines> = []
            let stationLineDict:[String:JSON] = x["lines"].dictionaryValue
            
            for (skey,subjson) in stationLineDict {
                let lines = MRTLines(lineName: skey,lineStation: subjson.string!,lineBackgroundColor: )
                array.append(lines)
            }
            
            let mrtstation = MRTStation(stationName:x["name"].string!,line: array )
            return mrtstation
        })
        */
        
        dataArray.forEach({print($0)})
    }
    
    func getData() -> Array<Array<MRTStation>>{
        return dataArray
    }
    
    
    func getLine() -> Array<String>{
        return Array(lineDictionary.keys)

    }
    
}





