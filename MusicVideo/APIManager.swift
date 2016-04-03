//
//  APIManager.swift
//  MusicVideo
//
//  Created by Kevin Fournier on 2016-03-30.
//  Copyright © 2016 Kevin Fournier. All rights reserved.
//

import Foundation

class APIManager {

    func loadData(urlString:String, completion: (result:String) -> Void) {
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
//        let session = NSURLSession.sharedSession()
        let url = NSURL(string:urlString)!
        
        let task = session.dataTaskWithURL(url)  {
            (data, response, error) -> Void in
            
            if error != nil {
                dispatch_async(dispatch_get_main_queue())  {
                    completion(result: (error!.localizedDescription))
                }
                
            } else {
                
                //Added for JSONSerialization
                //print(data)
                do {
                    /* .AllowFragements - top level object is not Aray or Dictionary.  Any string or value.  needs a do/try/cathc processes to convert NSDATA into a Json object and cst into a Dictionary */
                    
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                        as? JSONDictionary {
                        
                             print(json)
                        
                        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        dispatch_async(dispatch_get_global_queue(priority, 0)) {
                            dispatch_async(dispatch_get_main_queue())  {
                                completion(result: "JSONSerialization Successful")
                            }
                        }
                    }
                } catch {
                    dispatch_async(dispatch_get_main_queue())  {
                        completion(result: "error in NSJSONSerialization")
                    }
                }
                 //end of JSONSerialization

              }
          }

        task.resume()
     }
}