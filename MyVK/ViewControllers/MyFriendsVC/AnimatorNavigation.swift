//
//  AnimatorNavigation.swift
//  MyVK
//
//  Created by Максим Марков on 27.06.2022.
//

import UIKit

class AnimatorNavigation: NSObject, UIViewControllerAnimatedTransitioning {
    let durationTimeInterval: Double = 1
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        durationTimeInterval
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let sourceVC = transitionContext.viewController(forKey: .from),
              let destinationVC = transitionContext.viewController(forKey: .to)
        else {return}
        
        let sourceSuperView = sourceVC.view.superview
        let destinationView = destinationVC.view
        let duration = transitionDuration(using: transitionContext)
        sourceSuperView?.addSubview(destinationView!)
        
        let frameHeight = destinationView?.frame.height
        let frameWidth = destinationView?.frame.width
        let pos = frameHeight! / 2 + frameWidth! / 2
        destinationView?.transform = CGAffineTransform(rotationAngle: .pi / -2).concatenating(CGAffineTransform(translationX: pos, y: -pos))
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1){
            destinationView?.transform = .identity
        } completion: { _ in
            transitionContext.completeTransition(true)
        }
//        UIView.transition(from: sourceView!,
//                          to: destinationView!,
//                          duration: duration,
//                          options: [.transitionFlipFromBottom]) { _ in
//            transitionContext.completeTransition(true)
//        }
    
    }
    
}
