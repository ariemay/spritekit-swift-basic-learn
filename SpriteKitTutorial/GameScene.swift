//
//  GameScene.swift
//  SpriteKitTutorial
//
//  Created by Arie May Wibowo on 08/06/20.
//  Copyright © 2020 Arie May Wibowo. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let label = SKLabelNode(text: "Hello SpriteKit!")
    
    override func didMove(to view: SKView) {
        label.fontColor = SKColor.red
        label.fontSize = 32
        label.fontName = "Avenir"
        label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        addChild(label)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(recognizer)

    }
    
    @objc func tap(recognizer: UIGestureRecognizer) -> Void {
        let viewLocation = recognizer.location(in: view)
        let sceneLocation = convertPoint(fromView: viewLocation)
//        let moveToAction = SKAction.move(to: sceneLocation, duration: 1)
        let moveByAction = SKAction.moveBy(x: sceneLocation.x - label.position.x, y: sceneLocation.y - label.position.y, duration: 1)
        
        let moveByReverseAction = moveByAction.reversed()
        let moveByActions = [moveByAction, moveByReverseAction]
        let moveSequence = SKAction.sequence(moveByActions)
        
        let moveRepeatSequence = SKAction.repeat(moveSequence, count: 3)
        label.run(moveRepeatSequence)
    }
    
}
