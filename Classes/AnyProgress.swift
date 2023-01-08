//
//  AnyProgress.swift
//  AnyProgress
//
//  Created by Sohag on 8/12/22.
//

import Foundation
import UIKit


public enum ANYProgressType{
    case linear
    case circular
    case logo
}

public protocol ANYProgressView {
    var progressColor:UIColor {get set}
    var progressBgColor:UIColor {get set}
    func showProgress(_ progress: CGFloat, duration:CGFloat?)
    func setImage(maskingImage image: UIImage)
}

extension ANYProgressView {
    public func setImage(maskingImage image: UIImage){}
}

open class AnyProgress {
    public static func createProgress(frame:CGRect,progressType:ANYProgressType) -> ANYProgressView{
        switch progressType {
        case .linear:
            return ANYLinearProgressView(frame: frame)
        case .circular:
            return ANYCircularProgressView(frame: frame)
        case .logo:
            return ANYLogoProgressView(frame: frame)
        }
    }
}
