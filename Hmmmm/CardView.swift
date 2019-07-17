//
//  CardView.swift
//  Hmmmm
//
//  Created by Anirban Kumar on 6/6/19.
//  Copyright © 2019 Anirban Kumar. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DesignView : UIView {
    @IBInspectable var cornerRadius : CGFloat = 0
    @IBInspectable var shadowColor : UIColor = .black

    @IBInspectable let shadowOffsetWidth : Int = 0
    @IBInspectable let shadowOffsetHeight : Int = 1
    
    @IBInspectable var shadowOpacity : Float = 0.4
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        
        layer.shadowOpacity = shadowOpacity
    }
}
