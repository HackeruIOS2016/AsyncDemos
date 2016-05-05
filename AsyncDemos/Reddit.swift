//
//  Reddit.swift
//  AsyncDemos
//
//  Created by HackerU on 05/05/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class Reddit:CustomStringConvertible{
    //MARK: Fields:
    let title:String
    let thumbnail:String
    let url:String
    
    //MARK: initializers
    init(title:String, thumbnail:String ,url:String){
        self.title = title
        self.thumbnail = thumbnail
        self.url = url
    }
    
    //MARK: public methods & computed variables
    var description:String{
        return "\(title)"
    }
}
