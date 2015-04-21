//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Robert Collins on 11/04/2015.
//  Copyright (c) 2015 Robert Collins. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {
    var happiness: Int = 75 {
        didSet {
            happiness = min(max(happiness,0),100)
            updateUI()
        }
    } // 0 very sad, 100 super happy
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    private func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }
    
}
