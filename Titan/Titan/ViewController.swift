//
//  ViewController.swift
//  Titan
//
//  Created by Sam Meech-Ward on 2019-07-10.
//  Copyright © 2019 meech-ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let newLayer = CALayer()
  
  let fromValue = CGPoint(x: 200, y: 100)
  let toValue = CGPoint(x: 200, y: 500)

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    view.layer.backgroundColor = UIColor.magenta.cgColor
    view.layer.addSublayer(newLayer)
    
    newLayer.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
    newLayer.backgroundColor = UIColor.blue.cgColor
    
    newLayer.cornerRadius = 20
    newLayer.shadowOpacity = 1.0
    newLayer.contents = UIImage(named: "titan")?.cgImage
    
    newLayer.shadowOffset = CGSize(width: 100, height: 100)
    newLayer.masksToBounds = true
    
    let anotherLayer = CALayer()
    anotherLayer.frame = CGRect(x: 50, y: 50, width: 1200, height: 1200)
    anotherLayer.backgroundColor = UIColor.cyan.cgColor
    newLayer.addSublayer(anotherLayer)
  }

  @IBAction func update(_ sender: Any) {
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 3.0
    animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
    
    if newLayer.position.y == fromValue.y {
      animation.toValue = toValue
      animation.fromValue = fromValue
    } else {
      animation.toValue = fromValue
      animation.fromValue = toValue
    }
    
    newLayer.add(animation, forKey: nil)
    
    dontAnimate {
      newLayer.position = animation.toValue! as! CGPoint
    }
  }
  
  func dontAnimate(_ cb: () -> (Void)) {
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    cb()
    CATransaction.commit()
  }
  
}

