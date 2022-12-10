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
    
    private var appLogo = UIImage(named: "apple-logo.png")
    
    @IBOutlet weak var progressContainer: UIView!{
        didSet{
            progressContainer.backgroundColor = .clear
            let logoProgress = LogoProgressView(frame: progressContainer.bounds)
            if let appLogo = self.appLogo{
                logoProgress.setImage(maskingImage: appLogo, bgColor: .systemGreen, progressColor: .systemRed)
            }
            progressContainer.addSubview(logoProgress)
            logoProgress.showProgress(0.7, animated: true, animationTime: 3)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

