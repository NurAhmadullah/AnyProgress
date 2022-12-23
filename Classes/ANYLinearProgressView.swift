//
//  LinearProgressView.swift
//  AnyProgress
//
//  Created by Sohag on 10/12/22.
//

import Foundation
import UIKit

@IBDesignable
open class ANYLinearProgressView: UIView {
    
    private let _lineLayer = CAShapeLayer()
    private let _lineBgLayer = CAShapeLayer()
    private var _animation = CABasicAnimation(keyPath: "strokeEnd")
    
    private var _prevProgress:CGFloat = 0.0
    private var _progressColor = UIColor.systemRed{
        didSet{
            _lineLayer.strokeColor = _progressColor.cgColor
        }
    }
    private var _progressBgColor = UIColor.gray{
        didSet{
            _lineBgLayer.strokeColor = _progressBgColor.cgColor
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
        self.commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
}

extension ANYLinearProgressView {
    private func commonInit(){

        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: 0))
        linePath.addLine(to: CGPoint(x: frame.size.width, y: 0))
        linePath.close()
        
        
        _lineLayer.path = linePath.cgPath
        _lineLayer.fillColor = UIColor.clear.cgColor
        _lineLayer.strokeColor = UIColor.red.cgColor
        _lineLayer.lineWidth = 5.0
        _lineLayer.strokeEnd = 0.0
    
        
        _lineBgLayer.path = linePath.cgPath
        _lineBgLayer.fillColor = UIColor.clear.cgColor
        _lineBgLayer.strokeColor = UIColor.systemGreen.cgColor
        _lineBgLayer.lineWidth = 10.0
        _lineBgLayer.strokeEnd = 1.0
        
        
        layer.addSublayer(_lineBgLayer)
        layer.addSublayer(_lineLayer)
    }
    
    private func animateProgress(from: CGFloat, to: CGFloat, duration: CGFloat) {
        _lineLayer.removeAnimation(forKey: "progressAnimation")
        _animation.fromValue = from
        _animation.toValue = to
        _animation.duration = duration
        _animation.isRemovedOnCompletion = false
        _lineLayer.add(_animation, forKey: "progressAnimation")
    }
    
    private func setStrokeEnd(progress:CGFloat){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        _lineLayer.strokeEnd = progress
        CATransaction.commit()
    }
}

extension ANYLinearProgressView: ANYProgressView {
    public func showProgress(_ progress: CGFloat, duration: CGFloat? = nil) {
        
        let prgress = CGFloat(progress) / 2
        
        if let duration = duration{
            self.animateProgress(from: _prevProgress, to: prgress, duration: duration)
        }
        self.setStrokeEnd(progress: prgress)
        _prevProgress = prgress
    }
}
