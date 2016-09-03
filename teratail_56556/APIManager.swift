//
//  APIManager.swift
//  teratail_46556
//
//  Created by KentarOu on 2016/09/03.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    class func downLoadDataAPI(downLoadTask: (sectionTitle: Array<String>, sectionData: Array<Array<DataModel>>)? -> () ) {
        
        Alamofire.request(.GET, "http://XXXXXXXXXX").validate().responseJSON { response in
            switch response.result {
            case .Success: ()
            
            var sectionTitle: Array<String> = []
            var dataModelArray:  Array<Array<DataModel>> = []
            
            if let value = response.result.value as? NSDictionary {
                let arrayData = value["movies"] as! NSDictionary
                
                for (key, value) in arrayData {
                    
                    sectionTitle.append(key as! String)
                    let dict = value as! NSDictionary
                    
                    var sectionData: Array<DataModel> = []
                    
                    for (_, value) in dict {
                        let array = value as! NSArray
                        for value in array {
                            
                            sectionData.append(DataModel.createData(value as! NSDictionary))
                        }
                    }
                    dataModelArray.append(sectionData)
                }
            }
            
            sectionTitle = sectionTitle.reverse()
            dataModelArray = dataModelArray.reverse()
            
            downLoadTask((sectionTitle: sectionTitle, sectionData: dataModelArray))
                
            case .Failure:
                
                downLoadTask(nil)
                print("情報を取得できませんでした。")
            }
        }
    }
}
