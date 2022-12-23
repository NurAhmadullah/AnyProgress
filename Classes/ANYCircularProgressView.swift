//
//  CircularProgressView.swift
//  AnyProgress
//
//  Created by Sohag on 10/12/22.
//

import Foundation
import UIKit

@IBDesignable
open class ANYCircularProgressView: UIView {
    
    private let _circleLayer = CAShapeLayer()
    private let _circleBgLayer = CAShapeLayer()
    private var _animation = CABasicAnimation(keyPath: "strokeEnd")
    
    private var _prevProgress:CGFloat = 0.0
    private var _progressColor = UIColor.systemRed{
        didSet{
            _circleLayer.strokeColor = _progressColor.cgColor
        }
    }
    private var _progressBgColor = UIColor.gray{
        didSet{
            _circleBgLayer.strokeColor = _progressBgColor.cgColor
        }
    }
    
    
    @IBInspectable
    public var progressColor: UIColor {
        get {
            return _progressColor
        }
        set {
            _progressColor = newValue
        }
    }
    
    @IBInspectable
    public var progressBgColor: UIColor {
        get {
            return _progressBgColor
        }
        set {
            _progressBgColor = newValue
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit(){
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        
        
        _circleLayer.path = circlePath.cgPath
        _circleLayer.fillColor = UIColor.clear.cgColor
        _circleLayer.strokeColor = UIColor.red.cgColor
        _circleLayer.lineWidth = 5.0
        _circleLayer.strokeEnd = 0.0
    
        
        _circleBgLayer.path = circlePath.cgPath
        _circleBgLayer.fillColor = UIColor.clear.cgColor
        _circleBgLayer.strokeColor = UIColor.systemGreen.cgColor
        _circleBgLayer.lineWidth = 10.0
        _circleBgLayer.strokeEnd = 1.0
        
        layer.addSublayer(_circleBgLayer)
        layer.addSublayer(_circleLayer)
    }
    
    private func animateProgress(from: CGFloat, to: CGFloat, duration: CGFloat) {
        _circleLayer.removeAnimation(forKey: "progressAnimation")
        _animation.fromValue = from
        _animation.toValue = to
        _animation.duration = duration
        _animation.isRemovedOnCompletion = false
        _circleLayer.add(_animation, forKey: "progressAnimation")
    }
    
    private func setStrokeEnd(progress:CGFloat){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        _circleLayer.strokeEnd = progress
        CATransaction.commit()
    }
}

extension ANYCircularProgressView: ANYProgressView {
    public func showProgress(_ progress: CGFloat, duration: CGFloat? = nil) {
        if let duration = duration{
            self.animateProgress(from: _prevProgress, to: progress, duration: duration)
        }
        self.setStrokeEnd(progress: progress)        // always have to set strokeEnd, even animate or not
        _prevProgress = progress
    }
}
