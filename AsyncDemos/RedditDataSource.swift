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
            print(response)
            print(data)
        }
    }
}
