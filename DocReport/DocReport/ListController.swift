//
//  ListController.swift
//  DocReport
//
//  Created by Albin on 30/08/16.
//  Copyright © 2016 Albin. All rights reserved.
//

import UIKit

class ListController: UIViewController{
    
    let coredataManager = CoreDataManager()
    
    @IBOutlet weak var listTableView: UITableView!
    
    var data:[List] = []
    var statusCount:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.registerNib(UINib(nibName: "HomeCell", bundle: nil) , forCellReuseIdentifier: "homeCellId")
        data = coredataManager.getAllList()!
        listTableView.reloadData()
        
    }
    
}


extension ListController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = listTableView.dequeueReusableCellWithIdentifier("homeCellId") as? HomeCell
        if let name = self.data[indexPath.row].name{
            cell?.nameLabel.text = name
            
        }
        if let age = self.data[indexPath.row].age{
            cell?.ageLabel.text = String(age)
            if Int(age) > 30{
                statusCount = statusCount + 1
            }
            
        }
        if let diabetic = self.data[indexPath.row].diabetic{
            if diabetic as Bool{
                cell?.diabeticLabel.text = "Yes"
                statusCount = statusCount + 1
            }else{
                cell?.diabeticLabel.text = "NO"
            }
            
        }
        if let breathingissue = self.data[indexPath.row].breathingissue{
            if breathingissue as Bool{
                cell?.breathingLabel.text = "Yes"
                statusCount = statusCount + 1
            }else{
                cell?.breathingLabel.text = "NO"
            }
            
        }
        if let sex = self.data[indexPath.row].sex{
            if sex as Bool{
                cell?.sexLabel.text = "Male"
            }else{
                cell?.sexLabel.text = "Female"
                statusCount = statusCount + 1
            }
            
        }
        
        if statusCount == 0{
            cell!.heartlabel.text = "0%"
        }else if statusCount <= 2{
            cell!.heartlabel.text = "50%"
        }else if statusCount > 2{
            cell!.heartlabel.text = "100%"
        }
        
        
        return cell!
    }
    
}
