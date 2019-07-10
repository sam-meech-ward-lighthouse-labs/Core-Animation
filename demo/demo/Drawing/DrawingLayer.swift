//
//  DrawingLayer.swift
//  demo
//
//  Created by Sam Meech-Ward on 2019-07-10.
//  Copyright © 2019 meech-ward. All rights reserved.
//

import UIKit

class DrawingLayer: UIView {
  
  private var _shapeLayer: CAShapeLayer?
  var shapeLayer: CAShapeLayer {
    guard let layer = _shapeLayer else {
      let _shapeLayer = CAShapeLayer()
      self.layer.addSublayer(_shapeLayer)
      _shapeLayer.contentsScale = UIScreen.main.scale
      _shapeLayer.frame = self.bounds
      self._shapeLayer = _shapeLayer
      return _shapeLayer
    }
    return layer
  }
  
  var lines = [CAShapeLayer]()
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let point = touches.first?.location(in: self) else {
      return
    }
    
    let path = UIBezierPath()
    path.move(to: point)
    let layer = CAShapeLayer()
    
    layer.lineWidth = 5.0
    layer.strokeColor = UIColor.red.cgColor
//    layer.fillColor = UIColor.clear.cgColor
    layer.frame = self.bounds
    layer.path = path.cgPath
    
    
    shapeLayer.addSublayer(layer)
    lines.append(layer)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let point = touches.first?.location(in: self) else {
      return
    }
    
    if let lastIndex = lines.indices.last, let path = lines[lastIndex].path {
      let bezierPath = UIBezierPath(cgPath: path)
      bezierPath.addLine(to: point)
      lines[lastIndex].path = bezierPath.cgPath
    }
    
    updateLayer()
  }
  
  private func updateLayer() {
  }
}
