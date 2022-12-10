//
//  LogoProgress.swift
//  AnyProgress
//
//  Created by Sohag on 9/12/22.
//

import Foundation
import UIKit


open class LogoProgressView: UIView {
    
    private var animationTime: CGFloat = 0
    private var gradientLayer: CAGradientLayer!
    
    private var shouldAnimate = false
    
    private var prevLocations = [NSNumber(value: 0.0), NSNumber(value: 0.0)]
    private var curLocations = [NSNumber(value: 1.0), NSNumber(value: 1.0)]

    
    private var colors: [UIColor] {
        get {
            return gradientLayer.colors!.map{
                UIColor(cgColor: $0 as! CGColor)
            }
        }
        set {
            var cgColors = [CGColor]()
            cgColors = newValue.map{$0.cgColor}
            self.gradientLayer.colors = cgColors
        }
    }
    
    private var backColor: UIColor {
        get {
            return self.colors[0]
        }
        set {
            var currentColors = self.colors
            if currentColors.count > 0 {
                currentColors[0] = newValue
                self.colors = currentColors
            }
            self.setNeedsDisplay()
        }
    }
    
    private var progressColor: UIColor {
        get {
            return self.colors[1]
        }
        set {
            var currentColors = self.colors
            if currentColors.count > 0 {
                currentColors[1] = newValue
                self.colors = currentColors
            }
            self.setNeedsDisplay()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
}


extension LogoProgressView {
    public func setImage(maskingImage image: UIImage, bgColor:UIColor, progressColor: UIColor) {
        
        self.set(maskingImage: image)
        self.backColor = bgColor
        self.progressColor = progressColor
    }
    
    
    public func showProgress(_ progress: CGFloat, animated: Bool? = nil, animationTime:CGFloat? = nil) {
        
        curLocations = [NSNumber(value: progress), NSNumber(value: progress)]
        
        if let isAnim = animated{
            self.shouldAnimate = isAnim
        }
        if let animTime = animationTime{
            self.animationTime = animTime
        }
        
        self.showProgress(curLocations: self.curLocations, prevLocations: self.prevLocations)
    }
    
    private func showProgress(curLocations:[NSNumber], prevLocations:[NSNumber]){
        
        self.gradientLayer.locations = curLocations
        
        let animation2 = CABasicAnimation(keyPath: "locations")
        animation2.fromValue = prevLocations
        animation2.toValue = curLocations
        animation2.duration = self.animationTime
        self.gradientLayer.add(animation2, forKey: "locations")

        
        DispatchQueue.main.asyncAfter(deadline: .now() + self.animationTime) {
            self.prevLocations = self.curLocations
        }
    }
}

extension LogoProgressView {
    fileprivate func commonInit() {
        gradientLayer = CAGradientLayer(layer: self.layer)
        gradientLayer.frame = self.bounds
        layer.addSublayer(gradientLayer)
        
        animationTime = 0.5
        showProgress(0)
//        colors = [.green, .red, .blue]      //--- here first is bg-color, then 2nd 3rd are gradient
        colors = [.green, .red]
        backgroundColor = .clear
    }
    
    fileprivate func set(maskingImage image: UIImage) {
        let cgImageWithAlpha = image.cgImage
        let maskingLayer     = CALayer()
        maskingLayer.contents = cgImageWithAlpha
        
        self.layer.mask = maskingLayer
        maskingLayer.frame = self.layer.bounds
    }
}
