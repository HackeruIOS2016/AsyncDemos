//
//  RedditDataSource.swift
//  AsyncDemos
//
//  Created by HackerU on 05/05/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class RedditDataSource{
    
    private let session = NSURLSession.sharedSession()
    
    
    func getReddits(done:([Reddit]?, error:NSError?)->()){

        guard let url = NSURL(string: "https://www.reddit.com/r/funny/.json") else {return}
        
        let task = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let data = data {
               let result =  self.parseJson(data)
                
                dispatch_async(Queues.main, { () -> Void in
                    done(result, error: nil)
                })
            }
            else if let error = error{
                dispatch_async(Queues.main, { () -> Void in
                    done(nil, error: error)
                })
            }
        }
        
        task.resume() // task.suspend() task.cancel()
    }
    
    private func parseJson(data:NSData)->[Reddit]?{
        do{
            var redditsArr = [Reddit]()
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
            
            let reddits = json["data"]!!["children"] as! NSArray
            for reddit in reddits{
                let title = reddit["data"]!!["title"] as! String
                let url = reddit["data"]!!["url"] as! String
                let thumbnail = reddit["data"]!!["thumbnail"] as! String
                
                let reddit = Reddit(title: title, thumbnail: url, url: thumbnail)
                redditsArr.append(reddit)
            }
            return redditsArr
            
            //print(json)
        }
        catch let error as NSError{
            print(error.description)
            return nil
        }
    }
}
