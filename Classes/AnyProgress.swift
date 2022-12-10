//
//  AnyProgress.swift
//  AnyProgress
//
//  Created by Sohag on 8/12/22.
//

import Foundation
import UIKit

/*
enum ProgressStyle{
    case wave
    case dotted
    case gradient
    case color
    case image  // set use UIColor(image:"name.png")
}
*/

enum ProgressType{
    case linear
    case circular
    case logo
//    case halfCircular
//    case waveProgress       // set a wave property like gradient feature in all progress
}

@IBDesignable
open class AnyProgress {
    static func createProgress(frame:CGRect,progressType:ProgressType) -> UIView{
        switch progressType {
        case .linear:
            return LinearProgressView(frame: frame)
        case .circular:
            return CircularProgressView(frame: frame)
        case .logo:
            return LogoProgressView(frame: frame)
        }
    }
}
