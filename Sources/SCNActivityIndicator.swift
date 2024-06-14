//
//  SCNActivityIndicator.swift
//  SCNActivityIndicator
//
//  Created by Георгий Глухов on 14.06.2024.
//
import SceneKit

public class SCNActivityIndicator: SCNNode {
    
    private var capsules: [SCNNode] = []
    private let capsuleCount = 12
    private var currentCapsuleIndex = 0
    
   public init(radius: CGFloat, color: UIColor = .darkGray) {
        super.init()
        
        // Create sphere geometry
        let sphereGeometry = SCNSphere(radius: radius)
        
        // Create sphere material
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIColor.lightGray.withAlphaComponent(0.3)
        sphereMaterial.cullMode = .front
        sphereGeometry.materials = [sphereMaterial]
        
        // Create sphere node
        let sphereNode = SCNNode(geometry: sphereGeometry)
        addChildNode(sphereNode)
        
        sphereNode.eulerAngles.x = -.pi/2
        // Create capsules
        createCapsules(radius: radius, color: color)
        
        // Start animation
        animateCapsules()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCapsules(radius: CGFloat, color: UIColor) {
        let angleIncrement = 2 * .pi / CGFloat(capsuleCount)
        
        for i in 0..<capsuleCount {
            let capsule = createCapsule(radius: radius, color: color)
            let angle = angleIncrement * CGFloat(i)
            capsule.position = calculateCapsulePosition(radius: radius, angle: angle)
            capsule.eulerAngles.y = Float(-angle + .pi / 2)
            capsule.eulerAngles.x = -.pi / 2
            capsules.append(capsule)
            addChildNode(capsule)
        }
    }
    
    private func createCapsule(radius: CGFloat, color: UIColor) -> SCNNode {
        let capsuleGeometry = SCNCapsule(capRadius: radius / 16, height: radius / 3.5)
        let capsuleMaterial = SCNMaterial()
        capsuleMaterial.diffuse.contents = color
        capsuleGeometry.materials = [capsuleMaterial]
        return SCNNode(geometry: capsuleGeometry)
    }
    
    private func calculateCapsulePosition(radius: CGFloat, angle: CGFloat) -> SCNVector3 {
        let x = cos(angle) * (radius / 2.5)
        let z = sin(angle) * (radius / 2.5)
        return SCNVector3(x, 0, z)
    }
    
    private func animateCapsules() {
        let animationDuration = 3.0 // Длительность анимации для полного круга
        
        // Вращение в другую сторону
        let rotateAction = SCNAction.rotateBy(x: 0, y: -2 * .pi, z: 0, duration: animationDuration)
        let repeatAction = SCNAction.repeatForever(rotateAction)
        runAction(repeatAction)
        
        for i in 0..<capsuleCount {
            let opacity: CGFloat = max(CGFloat(i)/CGFloat(capsuleCount - 1), 0.5)
            capsules[i].geometry?.materials.first?.diffuse.contents = UIColor.darkGray.withAlphaComponent(opacity)
        }
    }
    
    private func updateCapsuleOpacity(activeIndex: Int) {
        for i in 0..<capsuleCount {
            let opacity: CGFloat = i == activeIndex ? 1.0 : 0.3
            capsules[i].geometry?.materials.first?.diffuse.contents = UIColor.darkGray.withAlphaComponent(opacity)
        }
    }
}
