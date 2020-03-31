//
//  FullScreenImageView.swift
//  TestMediaSearch
//
//  Created by Egor Shashkov on 23/07/2018.
//  Copyright © 2018 Egor Shashkov. All rights reserved.
//

import Foundation
import UIKit

class FullScreenImageView: UIImageView {
    
    var tempRect: CGRect?
    var bgView: UIView!
    
    var animDuration = 0.25

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(FullScreenImageView.popUpImageToFullScreen))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }

    @objc func exitFullScreen() {
        guard let imageV = bgView.subviews[0] as? UIImageView, let rect = tempRect else { return }
        UIView.animate(withDuration: animDuration, animations: {
            imageV.frame = rect
            self.bgView.alpha = 0
        }, completion: { _ in
            self.bgView.removeFromSuperview()
        })
    }
    
    @objc func popUpImageToFullScreen() {
        if let window = UIApplication.shared.delegate?.window, let parentView = self.findParentViewController(self)?.view {
            bgView = UIView(frame: UIScreen.main.bounds)
            bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FullScreenImageView.exitFullScreen)))
            bgView.alpha = 0
            bgView.backgroundColor = UIColor.black
            let imageV = UIImageView(image: self.image)
            let point = self.convert(self.bounds, to: parentView)
            imageV.frame = point
            tempRect = point
            imageV.contentMode = .scaleAspectFit
            bgView.addSubview(imageV)
            window?.addSubview(bgView)
            
            UIView.animate(withDuration: animDuration, animations: {
                parentView.endEditing(true)
                self.bgView.alpha = 1
                imageV.frame = CGRect(x: 0, y: 0, width: parentView.frame.width, height: parentView.frame.width)
                imageV.center = parentView.center
            })
        }
    }
    
    func findParentViewController(_ view: UIView) -> UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            guard let next = parentResponder?.next else { return nil }
            parentResponder = next
            if let viewController = parentResponder as? UIViewController {
                UIView.performWithoutAnimation {
                    viewController.view.endEditing(false)
                }
                return viewController
            }
        }
        return nil
    }
}
