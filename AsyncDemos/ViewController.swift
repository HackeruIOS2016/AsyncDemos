//
//  ViewController.swift
//  AsyncDemos
//
//  Created by HackerU on 05/05/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pumpkinImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //start
        activityIndicator.startAnimating()
        
        dispatch_async(Queues.userInteractive) {
           let pumpkin = self.growPumpkin()
           
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


    
    func growPumpkin()->UIImage?{
        for i in 0...1000000{
            print("\(Float(i)/1000000 * 100 )percent")
        }
        return UIImage(named: "pumpkin")
    }
}

