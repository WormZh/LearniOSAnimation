//
//  PositionViewController.swift
//  LearniOSAnimation
//
//  Created by worm on 16/7/26.
//  Copyright © 2016年 worm. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {
  
  @IBOutlet weak var blueSquare: UIView!
  
  @IBOutlet weak var orangeSquare: UIView!
  
  @IBOutlet weak var redSquare: UIView!
  
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
    
    // 动画时长 1 秒，蓝色方块移动到右边对称的位置
    UIView.animateWithDuration(1) { 
      self.blueSquare.center.x = self.view.frame.width - self.blueSquare.center.x
    }
    
    // 动画时长 1 秒，延时 0.5 秒启动，橙色方块移动到下方对称的位置
    UIView.animateWithDuration(1, delay: 0.5, options: UIViewAnimationOptions.TransitionNone, animations: {
      
      self.orangeSquare.center.y = self.view.bounds.height - self.orangeSquare.center.y
      
    }, completion: nil)
    
    // 动画时长 1 秒，延时 1 秒启动，红色方块移动到左下角对称的位置
    UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.TransitionNone, animations: { 
      
      self.redSquare.center.x = self.view.bounds.width - self.redSquare.center.x
      self.redSquare.center.y = self.view.bounds.height - self.redSquare.center.y
    }, completion: nil)
  }
  
}
