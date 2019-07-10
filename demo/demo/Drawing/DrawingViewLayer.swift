//
//  DrawingView.swift
//  demo
//
//  Created by Sam Meech-Ward on 2019-07-10.
//  Copyright © 2019 meech-ward. All rights reserved.
//

import UIKit

class DrawingViewLayer: UIView {

  var lines = [UIBezierPath]()
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let point = touches.first?.location(in: self) else {
      return
    }
    
    let path = UIBezierPath()
    path.move(to: point)
    lines.append(path)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let point = touches.first?.location(in: self) else {
      return
    }

    if let lastIndex = lines.indices.last {
      lines[lastIndex].addLine(to: point)
    }
    
    layer.setNeedsDisplay()
  }
  
//  override func draw(_ layer: CALayer, in context: CGContext) {
//    context.setStrokeColor(UIColor.red.cgColor)
//    context.setLineWidth(5)
//    context.setLineCap(.round)
//    
//    lines.forEach { line in
//      context.addPath(line.cgPath)
//    }
//    context.strokePath()
//  }
}
