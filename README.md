## **SCNActivityIndicator**

A visually engaging 3D loading indicator for ARKit applications, inspired by the standard UIActivityIndicatorView, but rendered as an animated sphere with capsules directly within your augmented reality scene.

## **Demonstration**
<img width="200" alt="Main view gif demonstration" src="https://github.com/Georgy-hook/SCNActivityIndicator/assets/78609985/94bb3b46-2952-48ab-a3b9-3920bde01182">

## **Stack**
Swift 5, ARKit, SceneKit

## **Usage**
1. Import lib
  ```swift
import SCNActivityIndicator
  ```
2. Add activity indicator to scene
  ```swift
  let activityIndicator = SCNActivityIndicator(radius: 0.1, color: .blue)
  sceneView.scene.rootNode.addChildNode(activityIndicator)
  ```
## **Technical requirements**

- To run, you need an iPhone with iOS 12 or higher, only portrait mode is provided;
- Interface elements adapt to iPhone screen resolutions, starting from X - layout for SE and iPad is not provided;
- Run only on device (not simulator)
