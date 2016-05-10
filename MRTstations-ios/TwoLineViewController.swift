//
//  TwoLineViewController.swift
//  MRTstations-ios
//
//  Created by huang tsun yu on 2016/5/10.
//  Copyright © 2016年 huang tsun yu. All rights reserved.
//

import UIKit

class TwoLineViewController: UIViewController {

    
    @IBOutlet weak var navigation: UINavigationItem!
    
    @IBOutlet weak var stationName: UILabel!
    
    @IBOutlet weak var lineOne: UILabel!
    
    @IBOutlet weak var lineTwo: UILabel!
    
    var mrtStation: MRTStation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigation.title = mrtStation.stationName
        stationName.text = mrtStation.stationName
        lineOne.text = mrtStation.line[0].lineName
        lineOne.backgroundColor = mrtStation.line[0].lineBackgroundColor
        lineTwo.text = mrtStation.line[1].lineName
        lineTwo.backgroundColor = mrtStation.line[1].lineBackgroundColor
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}