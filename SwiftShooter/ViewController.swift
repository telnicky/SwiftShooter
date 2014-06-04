//
//  ViewController.swift
//  SwiftShooter
//
//  Created by travis elnicky on 6/3/14.
//  Copyright (c) 2014 Travis Elnicky. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var spriteView = self.view as SKView
        spriteView.showsDrawCount = true
        spriteView.showsNodeCount = true
        spriteView.showsFPS = true
    }
    
    override func viewWillAppear(animated: Bool) {
        var helloScene = HelloScene(size: CGSizeMake(768, 1024))
        var spriteView = self.view as SKView
        spriteView.presentScene(helloScene)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        var spriteView = SKView()
        self.view = spriteView
    }


}

