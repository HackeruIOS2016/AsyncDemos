//
//  RedditDataSource.swift
//  AsyncDemos
//
//  Created by HackerU on 05/05/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class RedditDataSource{
    func simpleDemo(){
       let session = NSURLSession.sharedSession()
       
        guard let url = NSURL(string: "https://www.reddit.com/r/funny/.json") else {return}
        
        let task = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            
            let json = try? NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
            
            let otherjson = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
            
            do{
                let json2 = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                
                print(json2)
            }
            catch let error as NSError{
                print(error.description)
            }
        }
        
        task.resume() // task.suspend() task.cancel()
    }
}
