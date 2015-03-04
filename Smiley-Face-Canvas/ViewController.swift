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
    var faceOriginalCenter: CGPoint!
    var newlyCreatedFace: UIImageView!
    
    @IBOutlet var screenView: UIView!
    @IBOutlet weak var trayView: UIView!
    
    @IBAction func dragFace(sender: UIPanGestureRecognizer) {
        var point = sender.locationInView(screenView)
        
        switch sender.state {
        case UIGestureRecognizerState.Began:
            var imageView = sender.view as UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            screenView.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            startPoint = point
            faceOriginalCenter = newlyCreatedFace.center
        case UIGestureRecognizerState.Changed:
            newlyCreatedFace.center.x = faceOriginalCenter.x + point.x - startPoint.x  // point.x
            newlyCreatedFace.center.y = faceOriginalCenter.y + point.y - startPoint.y  // point.y
//        case UIGestureRecognizerState.Ended:
            
        default:
            break
        }

    
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

