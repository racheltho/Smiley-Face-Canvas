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
    var trayUpCenter: CGPoint!
    var trayDownCenter: CGPoint!
    var startPoint: CGPoint!
    var newlyCreatedFace: UIImageView!
    
    @IBOutlet var screenView: UIView!
    @IBOutlet weak var trayView: UIView!
    
    @IBAction func dragFace(sender: UIPanGestureRecognizer) {
    
    
    }
    
    @IBAction func onTrayPanGesture(panGestureRecognizer: UIPanGestureRecognizer) {
        
        var point = panGestureRecognizer.locationInView(screenView)
        var velocity = panGestureRecognizer.velocityInView(screenView)
        
        switch panGestureRecognizer.state {
        case UIGestureRecognizerState.Began:
            startPoint = point
            trayOriginalCenter = trayView.center
        case UIGestureRecognizerState.Changed:
            var ytranslation = point.y - startPoint.y
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + ytranslation)
        case UIGestureRecognizerState.Ended:
            if velocity.y > 0 {
                trayView.center = trayDownCenter            }
            if velocity.y < 0 {
                trayView.center = trayUpCenter
            }
        default:
            break
        }
        screenView.layoutIfNeeded()
        trayView.layoutIfNeeded()
    }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trayUpCenter = trayView.center
        trayDownCenter = trayView.center
        let trayHeight = trayView.frame.height
        trayDownCenter.y = trayUpCenter.y + trayHeight - 36
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

