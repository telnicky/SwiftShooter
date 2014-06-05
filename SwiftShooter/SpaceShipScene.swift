//
//  SpaceShipScene.swift
//  SwiftShooter
//
//  Created by travis elnicky on 6/4/14.
//  Copyright (c) 2014 Travis Elnicky. All rights reserved.
//

import SpriteKit

class SpaceShipScene : SKScene {
    var contentCreated = false
    
    func createSceneContents() {
        backgroundColor = SKColor.blackColor()
        scaleMode = SKSceneScaleMode.AspectFit

        // Create spaceship node
        var spaceship = newSpaceShip()
        spaceship.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame) - 150)
        addChild(spaceship)
        
        // Spawn Rocks
        var makeRocks = SKAction.sequence([
                SKAction.runBlock({ self.addRock() }),
                SKAction.waitForDuration(0.10, withRange: 0.15)])

        runAction(SKAction.repeatActionForever(makeRocks))
    }
    
    func skRandf() -> CGFloat {
        let num: Float = Float(rand())
        let den: Float = Float(RAND_MAX)
        return num / den
    }
    
    func skRand(low: CGFloat, high: CGFloat) -> CGFloat {
        return skRandf() * (high - low) + low
    }
    
    func addRock() {
        var rock = SKSpriteNode(color: SKColor.brownColor(), size: CGSizeMake(8, 8))
        rock.position = CGPointMake(skRand(0, high: size.width), size.height - 50)
        rock.name = "rock"
        rock.physicsBody = SKPhysicsBody(rectangleOfSize: rock.size)
        rock.physicsBody.usesPreciseCollisionDetection = true
        addChild(rock)
        
    }
    
    override func didSimulatePhysics() {
        enumerateChildNodesWithName("rock", usingBlock: { (node: SKNode!, stop: CMutablePointer<ObjCBool>) in
            if (node.position.y < 0) {
                node.removeFromParent()
            }
        })
    }
    
    func newLight() -> SKSpriteNode {
        var light = SKSpriteNode(color: SKColor.yellowColor(), size: CGSizeMake(8, 8))
        
        var blink = SKAction.sequence([
                SKAction.fadeOutWithDuration(0.25),
                SKAction.fadeInWithDuration(0.25)
            ])
        
        var blinkForever = SKAction.repeatActionForever(blink)
        light.runAction(blinkForever)
        
        return light
    }
    
    func newSpaceShip() -> SKSpriteNode {
        var hull = SKSpriteNode(color: SKColor.grayColor(), size: CGSizeMake(64, 32))
        hull.physicsBody = SKPhysicsBody(rectangleOfSize: hull.size)
        hull.physicsBody.dynamic = false

        var light1 = newLight()
        var light2 = newLight()

        light1.position = CGPointMake(-28.0, 6.0)
        light2.position = CGPointMake(28.0, 6.0)

        hull.addChild(light1)
        hull.addChild(light2)
        
        var hover = SKAction.sequence([
                SKAction.waitForDuration(1.0),
                SKAction.moveByX(100, y: 50.0, duration: 1.0),
                SKAction.waitForDuration(1.0),
                SKAction.moveByX(-100, y: -50.0, duration: 1.0)])


        hull.runAction(SKAction.repeatActionForever(hover))
        return hull
    }
    
    
    override func didMoveToView(view: SKView!) {
        if !contentCreated {
            createSceneContents()
            contentCreated = true
        }
    }
}
