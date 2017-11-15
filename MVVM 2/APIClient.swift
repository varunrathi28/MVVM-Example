//
//  APIClient.swift
//  MVVM 2
//
//  Created by Varun Rathi on 15/11/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class APIClient : NSObject
{
    
    func getList(completion: @escaping ([NSDictionary]?) -> Void)
    {
        guard let url = URL(string: Constant.iTunesRSSUrl) else { print("Error: Improper URL") ; return}
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            guard let recievedData = data else { print("Error parsing data") ; return }
            do
            {
                if let responseJson = try JSONSerialization.jsonObject(with:recievedData, options: .allowFragments) as? NSDictionary
                {
                    
                    if let appList = responseJson.value(forKeyPath:"feed.results") as? [NSDictionary]
                    {
                        completion(appList)
                    }
                    
                }
            }
            catch
            {
                completion(nil)
                print("Error converting data to json")
                
            }
        }
        
        dataTask.resume()
    }
    
    
    
}
