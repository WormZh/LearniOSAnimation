//
//  RotationViewController.swift
//  LearniOSAnimation
//
//  Created by worm on 16/7/26.
//  Copyright © 2016年 worm. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {
  
  
  @IBOutlet weak var wheel: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func spin() {
    
    UIView.animateWithDuration(1, delay: 0, options: .CurveLinear, animations: {
      self.wheel.transform = CGAffineTransformRotate(self.wheel.transform, CGFloat(M_PI))
    }) { (finished) in
      self.spin()
    }
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    self.spin()
  }
}
