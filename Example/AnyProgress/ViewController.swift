//
//  ViewController.swift
//  AnyProgress
//
//  Created by SohagCSE on 12/08/2022.
//  Copyright (c) 2022 SohagCSE. All rights reserved.
//

import UIKit
import AnyProgress

class ViewController: UIViewController {

    private var appLogo = UIImage(named: "apple-logo.png")!

    @IBOutlet weak var progressContainer: UIView!{
        didSet{
            progressContainer.backgroundColor = .clear

            var logoProgress = AnyProgress.createProgress(frame: self.progressContainer.bounds, progressType: .logo)
            logoProgress.setImage(maskingImage: appLogo)
            logoProgress.showProgress(0.6, duration: 2)
            logoProgress.progressColor = UIColor.systemYellow
            logoProgress.progressBgColor = UIColor.systemGreen

            if let logoProgress = logoProgress as? UIView{
                progressContainer.addSubview(logoProgress)
            }
        }
    }


    
    @IBOutlet weak var circularProgressView: ANYCircularProgressView!{
        didSet{
            circularProgressView.showProgress(0.5, duration: 2)
            
            // below example for updating progress step by step
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.circularProgressView.showProgress(0.8)             // update progress without animation
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.circularProgressView.showProgress(0.3, duration: 2)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.circularProgressView.showProgress(0.7, duration: 2)
                        
                    }
                }
            }
        }
    }
    

    @IBOutlet weak var linearProgressView: ANYLinearProgressView!{
        didSet{
            linearProgressView.showProgress(0.5, duration: 2)
        }
    }
    
    @IBOutlet weak var logoProgressView: ANYLogoProgressView!{
        didSet{
            logoProgressView.showProgress(0.4, duration: 3)
        }
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

