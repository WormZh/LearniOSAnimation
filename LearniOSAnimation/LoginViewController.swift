//
//  LoginViewController.swift
//  LearniOSAnimation
//
//  Created by worm on 16/7/28.
//  Copyright © 2016年 worm. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var bubble1: UIImageView!
    
    @IBOutlet weak var bubble2: UIImageView!
    
    @IBOutlet weak var bubble3: UIImageView!
    
    @IBOutlet weak var bubble4: UIImageView!

    @IBOutlet weak var bubble5: UIImageView!
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var dot: UIImageView!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var login: UIButton!
    
    // Custom
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    var loginPossition = CGPoint.zero
    let warningMessage = UIImageView(image: UIImage(named: "Warning"))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bubble1.transform = CGAffineTransformMakeScale(0, 0)
        bubble2.transform = CGAffineTransformMakeScale(0, 0)
        bubble3.transform = CGAffineTransformMakeScale(0, 0)
        bubble4.transform = CGAffineTransformMakeScale(0, 0)
        bubble5.transform = CGAffineTransformMakeScale(0, 0)
        
        logo.center.x -= self.view.bounds.width
        logo.alpha = 0
        
        dot.center.x -= self.view.bounds.width
        dot.alpha = 0
        
        // adjust place holder text
        let userPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: username.frame.height))
        username.leftView = userPaddingView
        username.leftViewMode = .Always
        
        let userImageView = UIImageView(image: UIImage(named: "User"))
        userImageView.frame.origin = CGPoint(x: 12, y: 9)
        username.addSubview(userImageView)
        
        username.center.x -= self.view.bounds.width
        username.alpha = 0
        
        
        let passwordPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: password.frame.height))
        password.leftView = passwordPaddingView
        password.leftViewMode = .Always
        
        let passwordImageView = UIImageView(image: UIImage(named: "Key"))
        passwordImageView.frame.origin = CGPoint(x: 11, y: 9)
        password.addSubview(passwordImageView)
        
        password.center.x -= self.view.bounds.width
        password.alpha = 0
        
        
        loginPossition = login.center
        
        login.center.x -= self.view.bounds.width
        login.alpha = 0
        
        
        self.view.addSubview(warningMessage)
        warningMessage.center = loginPossition
        warningMessage.bounds = self.login.bounds
        warningMessage.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .TransitionNone, animations: {
            self.bubble1.transform = CGAffineTransformMakeScale(1, 1)
            self.bubble3.transform = CGAffineTransformMakeScale(1, 1)
            self.bubble4.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .TransitionNone, animations: {
            self.bubble2.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .TransitionNone, animations: {
            self.bubble5.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: .TransitionNone, animations: {
            self.logo.center.x += self.view.bounds.width
            self.logo.alpha = 1
        }, completion: nil)
        
        UIView.animateWithDuration(1.7, delay: 0.4, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .TransitionNone, animations: {
            self.dot.center.x += self.view.bounds.width
            self.dot.alpha = 1
        }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.3, options: .CurveEaseOut, animations: { 
            self.username.center.x += self.view.bounds.width
            self.username.alpha = 1
        }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.4, options: .CurveEaseOut, animations: {
            self.password.center.x += self.view.bounds.width
            self.password.alpha = 1
        }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.5, options: .CurveEaseOut, animations: {
            self.login.center.x += self.view.bounds.width
            self.login.alpha = 1
        }, completion: nil)
    }
    
    @IBAction func loginTapped(sender: UIButton) {
        sender.addSubview(spinner)
        spinner.frame.origin = CGPoint(x: 12, y: 12)
        spinner.startAnimating()
        
        UIView.transitionWithView(self.warningMessage, duration: 0.3, options: [.TransitionFlipFromBottom, .CurveEaseOut], animations: {
            self.warningMessage.hidden = true
        }, completion: nil)
        
        UIView.animateWithDuration(0.2) { 
            sender.center = self.loginPossition
        }
        
        sender.center.x -= 25
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: .TransitionNone, animations: {
            sender.center.x += 25
        }, completion: { _ in
            UIView.animateWithDuration(0.2, delay: 0, options: .CurveEaseOut, animations: {
                self.spinner.removeFromSuperview()
                sender.center.y += 80
            }, completion: { _ in
                UIView.transitionWithView(self.warningMessage, duration: 0.2, options: [.TransitionFlipFromTop, .CurveEaseOut], animations: { 
                    self.warningMessage.hidden = false
                }, completion: nil)
            })
        })
    }
}
