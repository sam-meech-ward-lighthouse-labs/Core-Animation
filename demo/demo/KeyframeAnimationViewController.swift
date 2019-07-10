//
//  KeyframeAnimationViewController.swift
//  demo
//
//  Created by Sam Meech-Ward on 2019-07-10.
//  Copyright © 2019 meech-ward. All rights reserved.
//

import UIKit

class KeyframeAnimationViewController: UIViewController {

  var path = UIBezierPath()
  let catLayer = CALayer()
  
  override func viewDidLoad() {
      super.viewDidLoad()

    let image = UIImage(named: "cat")
    
    catLayer.contents = image?.cgImage
    catLayer.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
    catLayer.contentsGravity = .resizeAspectFill
    catLayer.borderColor = UIColor.black.cgColor
    catLayer.borderWidth = 5
    catLayer.cornerRadius = 10
    catLayer.shadowColor = UIColor.black.cgColor
    catLayer.shadowOffset = CGSize(width: 100, height: 100)
    catLayer.shadowOpacity = 1.0
    catLayer.masksToBounds = true
    view.layer.addSublayer(catLayer)
      // Do any additional setup after loading the view.
  }
    
  private func animate() {
    CATransaction.begin()
    let animation = CAKeyframeAnimation(keyPath: "position")
    animation.path = path.cgPath
    animation.duration = 3
    catLayer.add(animation, forKey: "cat path")
    CATransaction.commit()
    
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    self.catLayer.position = self.path.currentPoint
    CATransaction.commit()
    
    
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let point = touches.first?.location(in: self.view) else {
      return
    }
    path = UIBezierPath()
    path.move(to: point)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let point = touches.first?.location(in: self.view) else {
      return
    }
    path.addLine(to: point)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    animate()
  }

}
