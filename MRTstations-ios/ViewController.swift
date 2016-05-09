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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        cell.StationName.text = "木柵"
        cell.lineOne.text = "文湖線"
        cell.lineOne.backgroundColor = UIColor(red: 158/255, green:101/255, blue: 46/255, alpha: 1.0)
        cell.lineTwo.hidden = true
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print(section)
        return "文湖線"
    }

}

