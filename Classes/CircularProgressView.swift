//
//  CircularProgressView.swift
//  AnyProgress
//
//  Created by Sohag on 10/12/22.
//

import Foundation
import UIKit


@IBDesignable
open class CircularProgressView: UIView {
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit(){
        
    }
}
