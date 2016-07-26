//
//  ScaleViewController.swift
//  LearniOSAnimation
//
//  Created by worm on 16/7/26.
//  Copyright © 2016年 worm. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {
  
  @IBOutlet weak var blueSquare: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    UIView.animateWithDuration(1) { 
      self.blueSquare.transform = CGAffineTransformMakeScale(0.1, 0.1)
      self.blueSquare.alpha = 0
    }
  }
  
}
