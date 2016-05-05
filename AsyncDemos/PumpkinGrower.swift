//
//  PumpkinGrower.swift
//  AsyncDemos
//
//  Created by HackerU on 05/05/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit

class PumpkinGrower {
    func growPumpkin(delegate: PumpkinDelegate){
        dispatch_async(Queues.userInteractive) { () -> Void in
            for i in 0...1000000{
                
                let progress =  Float(i)/1000000
                print("\(progress * 100) percent")
                
                if i % 100 == 0{
                    dispatch_async(Queues.main, { () -> Void in
                        delegate.pumpkinGrowthProgress(progress)
                    })
                    //report the progress
                }
            }
            dispatch_async(Queues.main) { () -> Void in
                delegate.doneGrowingPumpkin(UIImage(named: "pumpkin")!)
            }
        }
    }
}

protocol PumpkinDelegate{
    func doneGrowingPumpkin(image:UIImage)
    func pumpkinGrowthProgress(progress:Float)
}
