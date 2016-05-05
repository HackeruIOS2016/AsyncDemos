//
//  ViewController.swift
//  AsyncDemos
//
//  Created by HackerU on 05/05/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var pumpkinImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //start
        activityIndicator.startAnimating()
        
        dispatch_async(Queues.userInteractive) {
            let pumpkin = self.growPumpkin({ (p) -> () in
                self.progress.progress = p
                
            })
           
            //updating the UI must run on UI Thread!!!
            dispatch_async(Queues.main, { () -> Void in
                self.pumpkinImageView.image = pumpkin
                self.pumpkinImageView.hidden = false
                self.activityIndicator.stopAnimating()
            })
            //
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func growPumpkin(progressBlock: (Float)->())->UIImage?{
        for i in 0...1000000{
            
            let progress =  Float(i)/1000000
            print("\(progress * 100) percent")
           
            if i % 100 == 0{
                dispatch_async(Queues.main, { () -> Void in
                    progressBlock(progress)
                })
                //report the progress
               
            }
        }
        return UIImage(named: "pumpkin")
    }
}

