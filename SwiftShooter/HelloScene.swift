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
        helloNode.name = "helloNode"
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
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        var helloNode = childNodeWithName("helloNode")
        if helloNode? {
            helloNode.name = nil;
            var moveUp = SKAction.moveByX(0, y: 100.0, duration: 0.5)
            var zoom = SKAction.scaleTo(2.0, duration: 0.25)
            var pause = SKAction.waitForDuration(0.5)
            var fadeAway = SKAction.fadeOutWithDuration(0.25)
            var remove = SKAction.removeFromParent()
            var actions = [moveUp, zoom, pause, fadeAway, remove]
            var moveSequence = SKAction.sequence(actions)
            helloNode.runAction(moveSequence)
            helloNode.runAction(moveSequence, completion: {
                var spaceshipScene = SpaceShipScene.init(size: self.size)
                var doors = SKTransition.doorsOpenVerticalWithDuration(0.5)
                self.view.presentScene(spaceshipScene, transition: doors)
            })
        }
    }
    
}