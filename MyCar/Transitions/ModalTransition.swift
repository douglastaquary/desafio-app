//
//  ModalTransition.swift
//  MyCar
//
//  Created by Douglas Taquary on 11/09/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

class ModalTransition: NSObject,
    UIViewControllerTransitioningDelegate,
UIViewControllerAnimatedTransitioning {
    
    enum State {
        case presenting
        case dismissing
    }
    
    var state: State = .presenting
    
    // MARK: UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        state = .presenting
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        state = .dismissing
        return self
    }
    
    // MARK: UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        let animationDuration: TimeInterval = 0.3
        
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch state {
        case .presenting:
            present(using: transitionContext)
        case .dismissing:
            dismiss(using: transitionContext)
        }
    }
    
    let blackView = UIView()
    
    func present(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let from = transitionContext.viewController(forKey: .from),
            let to = transitionContext.viewController(forKey: .to) else {
                Log.debug("Missing context")
                return
        }
        
        let view = transitionContext.containerView
        let grid: CGFloat = 8
        let topSpace: CGFloat = 3 * 8
        let endFrame = from.view.bounds.divided(atDistance: topSpace,
                                                from: .minYEdge).remainder
        var startFrame = endFrame
        startFrame.origin.y = endFrame.size.height
        
        let blackView = self.blackView
        blackView.frame = from.view.bounds.divided(atDistance: grid,
                                                   from: .maxYEdge).remainder
        blackView.alpha = 0.0
        blackView.backgroundColor = .black
        
        view.addSubview(blackView)
        view.addSubview(to.view)
        
        from.view.isUserInteractionEnabled = false
        to.view.frame = startFrame
        to.view.layer.cornerRadius = grid
        to.view.layer.masksToBounds = true
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0,
                       options: [.curveEaseOut],
                       animations: {
                        from.view.tintAdjustmentMode = .dimmed
                        blackView.alpha = 0.7
                        to.view.frame = endFrame
        }, completion: { completed in
            transitionContext.completeTransition(true)
        })
    }
    
    func dismiss(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let from = transitionContext.viewController(forKey: .from),
            let to = transitionContext.viewController(forKey: .to) else {
                Log.debug("Missing context")
                return
        }
        
        let view = transitionContext.containerView
        let startFrame = from.view.bounds
        var endFrame = startFrame
        endFrame.origin.y = view.bounds.size.height
        
        let blackView = self.blackView
        
        to.view.isUserInteractionEnabled = true
        to.view.frame = view.bounds
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0,
                       options: [.curveEaseIn],
                       animations: {
                        to.view.tintAdjustmentMode = .automatic
                        blackView.alpha = 0.0
                        from.view.frame = endFrame
        }, completion: { completed in
            blackView.removeFromSuperview()
            transitionContext.completeTransition(true)
        })
    }
    
}
