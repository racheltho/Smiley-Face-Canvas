//
//  ViewController.swift
//  Smiley-Face-Canvas
//
//  Created by Rachel Thomas on 3/3/15.
//  Copyright (c) 2015 Rachel Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var trayOriginalCenter: CGPoint!
    var start_point: CGPoint!
    
    @IBOutlet var screenView: UIView!
    @IBOutlet weak var trayView: UIView!
    
    @IBAction func onTrayPanGesture(panGestureRecognizer: UIPanGestureRecognizer) {
        
        var point = panGestureRecognizer.locationInView(screenView)
        
        switch panGestureRecognizer.state {
        case UIGestureRecognizerState.Began:
            start_point = point
            trayOriginalCenter = trayView.center
            println("trayOriginalCenter: \(trayOriginalCenter.y)")
            println("Gesture began at: \(start_point.y)")
        case UIGestureRecognizerState.Changed:
            println("Gesture changed at: \(point.y)")
            var ytranslation = point.y - start_point.y
            println("translation: \(ytranslation)")
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + ytranslation)
        case UIGestureRecognizerState.Ended:
            println("Gesture ended at: \(point)")
        default:
            break
        }
    
    }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

