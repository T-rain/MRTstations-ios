//
//  ViewController.swift
//  MRTstations-ios
//
//  Created by huang tsun yu on 2016/5/8.
//  Copyright © 2016年 huang tsun yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var mrtTable: UITableView!
    
    
    
    var lineNames = ["a","b","c"]
    var staNames = ["a1","a2","a3","b1","b2","b3","c1","c2","c3"]
    var mrtData = MRTdata().getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return lineNames[section]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        print(indexPath)
        let sinp = indexPath.section*3+indexPath.row
        print(sinp)
        cell.StationName.text = staNames[sinp]
        cell.lineOne.text = "文湖線"
        cell.lineOne.backgroundColor = UIColor(red: 158/255, green:101/255, blue: 46/255, alpha: 1.0)
        cell.lineTwo.hidden = true
        return cell
    }
    


}

