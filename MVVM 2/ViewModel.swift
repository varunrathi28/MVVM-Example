//
//  ViewModel.swift
//  MVVM 2
//
//  Created by Varun Rathi on 15/11/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class ViewModel : NSObject
{
    @IBOutlet var apiClient:APIClient!
    var apps : [NSDictionary]?
    
    func getList (completion: @escaping ()-> Void)
    {
        apiClient.getList { (appDic) in
            
            DispatchQueue.main.async {
                self.apps = appDic
                completion()
            }
            
        }
    }
    
    func numberOfItemsToDisplay(in section:Int) -> Int
    {
        return apps?.count ?? 0
    }
    
    func appTitleToDisplay( for indexpath:IndexPath) -> String
    {
        return apps?[indexpath.row].value(forKeyPath: "name") as? String ?? ""
    }
    
    func appRatingToDisplay(for indexPath:IndexPath) ->String
    {
        return apps?[indexPath.row].value(forKeyPath: "id") as? String ?? ""
    }

    
}


