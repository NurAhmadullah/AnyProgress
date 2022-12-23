//
//  LogoProgress.swift
//  AnyProgress
//
//  Created by Sohag on 9/12/22.
//

import Foundation
import UIKit


@IBDesignable
open class ANYLogoProgressView: UIView {
    
    private var _animationDuration: CGFloat = 0
    private var _gradientLayer: CAGradientLayer!
    
    private var _shouldAnimate = false
    
    private var _prevLocations = [NSNumber(value: 0.0), NSNumber(value: 0.0)]
    private var _curLocations = [NSNumber(value: 1.0), NSNumber(value: 1.0)]

    
    private var _colors: [UIColor] {
        get {
            return _gradientLayer.colors!.map{
                UIColor(cgColor: $0 as! CGColor)
            }
        }
        set {
            var cgColors = [CGColor]()
            cgColors = newValue.map{$0.cgColor}
            _gradientLayer.colors = cgColors
        }
    }
    
    @IBInspectable
    public var logoImage:UIImage = UIImage(named: "apple-logo.png")!{
        didSet{
            self.setImage(maskingImage: logoImage)
            self.setNeedsDisplay()
        }
    }
    
    
    @IBInspectable
    public var progressColor: UIColor {
        get {
            return _colors[1]
        }
        set {
            var currentColors = _colors
            if currentColors.count > 0 {
                currentColors[1] = newValue
                _colors = currentColors
            }
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    public var progressBgColor: UIColor {
        get {
            return _colors[0]
        }
        set {
            var currentColors = _colors
            if currentColors.count > 0 {
                currentColors[0] = newValue
                _colors = currentColors
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


extension ANYLogoProgressView {
    
    private func animateProgress(curLocations:[NSNumber], prevLocations:[NSNumber]){
        
        _gradientLayer.locations = curLocations
        
        let animation2 = CABasicAnimation(keyPath: "locations")
        animation2.fromValue = prevLocations
        animation2.toValue = curLocations
        animation2.duration = _animationDuration
        _gradientLayer.add(animation2, forKey: "locations")

        
        DispatchQueue.main.asyncAfter(deadline: .now() + _animationDuration) {
            self._prevLocations = self._curLocations
        }
    }
}

extension ANYLogoProgressView {
    fileprivate func commonInit() {
        _gradientLayer = CAGradientLayer(layer: self.layer)
        _gradientLayer.frame = self.bounds
        layer.addSublayer(_gradientLayer)
        
        _animationDuration = 0.5
        showProgress(0)
//        colors = [.green, .red, .blue]      // here first is bg-color, then 2nd 3rd are gradient
        _colors = [.green, .red]
        backgroundColor = .clear
        
        setImage(maskingImage: logoImage)
    }
}

extension ANYLogoProgressView: ANYProgressView{
    public func showProgress(_ progress: CGFloat,  duration:CGFloat? = nil) {
        
        _curLocations = [NSNumber(value: progress), NSNumber(value: progress)]
        
        if let duration = duration{
            _animationDuration = duration
            _shouldAnimate = true
        }
        else{
            _shouldAnimate = false
        }
        
        self.animateProgress(curLocations: _curLocations, prevLocations: _prevLocations)
    }
    
    public func setImage(maskingImage image: UIImage) {
        
        let cgImageWithAlpha = image.cgImage
        let maskingLayer     = CALayer()
        maskingLayer.contents = cgImageWithAlpha
        
        self.layer.mask = maskingLayer
        maskingLayer.frame = self.layer.bounds
    }
}
