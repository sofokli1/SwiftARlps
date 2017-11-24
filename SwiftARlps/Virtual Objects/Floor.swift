//
//  Floor.swift
//  SwiftARlps
//
//  Created by Juxhin Bakalli on 24/11/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import ARKit

class Floor: SCNNode, Positionable {
    let size: CGFloat = 3
    var recentModelObjectDistances: [Float] = []
    
    override init() {
        super.init()
        self.geometry = SCNBox(width: size, height: 0.1, length: size, chamferRadius: 0)
        // This positions this node's content on top of it's coordinate, so it's placed on top of a plane, instead of halfway through
        self.pivot = SCNMatrix4MakeTranslation(0, 0, 0)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.green//(white: 0.0, alpha: 0.3)
        material.lightingModel = .physicallyBased
        
//        updatePhysicsBody()
        physicsBody = SCNPhysicsBody(type: SCNPhysicsBodyType.static, shape: SCNPhysicsShape(geometry: geometry!, options: nil))
        physicsBody?.isAffectedByGravity = false
        self.geometry?.materials = [material]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
