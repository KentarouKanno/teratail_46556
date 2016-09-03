//
//  ViewController.swift
//  teratail_56556
//
//  Created by KentarOu on 2016/09/03.
//  Copyright © 2016年 KentarOu. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var sectionTitleArray: Array<String>= []
    
    // Data Array
    var dataArray: Array<Array<DataModel>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.downLoadDataAPI { datas -> () in
            if let data = datas {
                self.sectionTitleArray = data.sectionTitle
                self.dataArray = data.sectionData
                self.tableView.reloadData()
            }
        }
        
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - TableView Delegate & DataSource
    
    // Section Title
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArray[section]
    }
    
    // Section Count
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitleArray.count
    }
    
    // Row Count
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    // Generate Cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = dataArray[indexPath.section][indexPath.row].title
        return cell
    }
    
    // Select Cell
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}