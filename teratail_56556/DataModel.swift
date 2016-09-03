//
//  DataModel.swift
//  teratail_46556
//
//  Created by KentarOu on 2016/09/03.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import Foundation

class DataModel {
    
    var id: Int = 0
    var title: String = ""
    var published_year: String = ""
    
    class func createData(dict: NSDictionary) -> DataModel {
        let data = DataModel()
        data.id = dict["id"] as! Int
        data.title = dict["title"] as! String
        data.published_year = dict["published_year"] as! String
        return data 
    }
}
