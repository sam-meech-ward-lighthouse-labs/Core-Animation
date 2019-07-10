//
//  ThreeDeeViewController.swift
//  demo
//
//  Created by Sam Meech-Ward on 2019-07-10.
//  Copyright © 2019 meech-ward. All rights reserved.
//

import UIKit

class ThreeDeeViewController: UIViewController {

  var newLayer: CALayer!
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      var perspective = CATransform3DIdentity
      perspective.m34 = -1.0/500;
      
      // Apply the transform to a parent layer.
      self.view.layer.sublayerTransform = perspective;
      
      newLayer = CALayer()
      newLayer.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
      newLayer.contents = UIImage(named: "cat")?.cgImage
    
      view.layer.addSublayer(newLayer)
    }
  
  @IBAction func slide(_ slider: UISlider) {
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    newLayer.transform = CATransform3DRotate(newLayer.transform, 0.1, 0, CGFloat(slider.value), 0)
    CATransaction.commit()
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
