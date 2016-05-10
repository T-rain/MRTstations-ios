//
//  OneLineViewController.swift
//  MRTstations-ios
//
//  Created by huang tsun yu on 2016/5/10.
//  Copyright © 2016年 huang tsun yu. All rights reserved.
//

import UIKit

class OneLineViewController: UIViewController {
    
    @IBOutlet weak var navigation: UINavigationItem!
    @IBOutlet weak var stationName: UILabel!
    @IBOutlet weak var lineName: UILabel!
    
    var mrtStation: MRTStation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stationName.text = mrtStation.stationName
        navigation.title = mrtStation.stationName
        lineName.text = mrtStation.line[0].lineName
        lineName.backgroundColor = mrtStation.line[0].lineBackgroundColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
