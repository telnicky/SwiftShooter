//
//  HelloScene.swift
//  SwiftShooter
//
//  Created by travis elnicky on 6/3/14.
//  Copyright (c) 2014 Travis Elnicky. All rights reserved.
//

import SpriteKit

class HelloScene : SKScene {
    var contentCreated = false
    
    func createSceneContents() {
        backgroundColor = SKColor.blueColor()
        scaleMode = SKSceneScaleMode.AspectFit
        addChild(newHelloNode())
    }
    
    func newHelloNode() -> SKLabelNode {
        var helloNode = SKLabelNode(fontNamed: "Chalkduster")
        helloNode.text = "Hello World!"
        helloNode.fontSize = 42
        helloNode.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
        return helloNode
    }
    
    override func didMoveToView(view: SKView!) {
        if !contentCreated {
            createSceneContents()
            contentCreated = true;
        }
    }
    
}