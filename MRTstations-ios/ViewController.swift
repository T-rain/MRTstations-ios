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
    
    
    
    //var lineNames = ["a","b","c"]
    //var staNames = ["a1","a2","a3","b1","b2","b3","c1","c2","c3"]
    var mrtData = MRTdata()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return mrtData.getLine().count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return mrtData.getLine()[section]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mrtData.getData()[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        //print(indexPath)
        //let sinp = indexPath.section*3+indexPath.row
        //print(sinp)
        cell.StationName.text = mrtData.getData()[indexPath.section][indexPath.row].stationName
        
        
        cell.lineOne.text = mrtData.getData()[indexPath.section][indexPath.row].line[0].lineStation
        cell.lineOne.backgroundColor = mrtData.getData()[indexPath.section][indexPath.row].line[0].lineBackgroundColor
        
        if(mrtData.getData()[indexPath.section][indexPath.row].line.count > 1){
            cell.lineTwo.text = mrtData.getData()[indexPath.section][indexPath.row].line[1].lineStation
            cell.lineTwo.backgroundColor = mrtData.getData()[indexPath.section][indexPath.row].line[1].lineBackgroundColor
        }else{
            cell.lineTwo.text = ""
            cell.lineTwo.backgroundColor = UIColor(red: 1.0, green:1.0, blue: 1.0, alpha: 1.0)
        }
    
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cellMrtData = getMrtStationWithIndexPath(indexPath)
        let lineCount = cellMrtData.line.count
        print(lineCount)
        switch lineCount {
        case 1:
            self.performSegueWithIdentifier("showOneLineDetail", sender: self)
        case 2:
            self.performSegueWithIdentifier("showTwoLineDetail", sender: self)
        default:
            break
        }
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let identifier = segue.identifier {
            switch identifier {
                case "showOneLineDetail":
                    let oneLineVC = segue.destinationViewController as! OneLineViewController
                    let indexPath = self.mrtTable.indexPathForSelectedRow
                    oneLineVC.mrtStation = getMrtStationWithIndexPath(indexPath!)
                case "showTwoLineDetail":
                    let twoLineVC = segue.destinationViewController as! TwoLineViewController
                    let indexPath = self.mrtTable.indexPathForSelectedRow
                    twoLineVC.mrtStation = getMrtStationWithIndexPath(indexPath!)
 
                default: break
                
            }
        }
        
        
    }
    
    func getMrtStationWithIndexPath(indexPath: NSIndexPath) -> MRTStation
    {
        return mrtData.getData()[indexPath.section][indexPath.row]
    }
    
    


}

