//
//  ViewController.swift
//  AsyncDemos
//
//  Created by HackerU on 05/05/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PumpkinDelegate {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var pumpkinImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func doneGrowingPumpkin(image:UIImage){
        pumpkinImageView.image = image
        pumpkinImageView.hidden = false
        progressView.hidden = true
        activityIndicator.hidden = true
    }
    func pumpkinGrowthProgress(progress:Float){
        progressView.progress = progress
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let grower = PumpkinGrower()
        grower.growPumpkin(self)
    }

}