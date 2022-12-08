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
    
    @IBOutlet weak var anyProgess: AnyProgress!{
        didSet{
            anyProgess.roundCorners(corners: [.topLeft,.bottomRight], radius: 20)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

