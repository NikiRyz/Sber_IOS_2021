//
//  DonutView.swift
//  my
//
//  Created by 18267440 on 11.06.2021.
//

import UIKit

final class DonutView: UIImageView {
    private var donutRadius: CGFloat = 0
    private var holeRadius: CGFloat = 0
    private  var rectangleInside: CGRect {
        CGRect(x: bounds.width / 2 - holeRadius,
               y: bounds.height / 2 - holeRadius,
               width: holeRadius * 2,
               height: holeRadius * 2)
    }
    convenience init(x: CGFloat,
                     y: CGFloat,
                     donutRadius: CGFloat,
                     holeRadius: CGFloat,
                     with image: UIImage?) {
        self.init(frame: CGRect(x: x,
                                y: y,
                                width: donutRadius * 2,
                                height: donutRadius * 2))
        
        self.donutRadius = donutRadius
        self.holeRadius = holeRadius
        self.image = image
        setupView()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard isUserInteractionEnabled else { return nil }
        guard !isHidden else { return nil }
        guard isDonutContaints(point) else { return nil }
        
        return super.hitTest(point, with: event)
    }
}


extension DonutView {
    private func isDonutContaints(_ point: CGPoint) -> Bool {
        let innerPath = UIBezierPath(ovalIn: rectangleInside)
        let mainPath = UIBezierPath(ovalIn: bounds)
        if !innerPath.contains(point) && mainPath.contains(point) {
            return true
        }
        return false
    }

    private func setupView() {
        layer.cornerRadius = donutRadius
        clipsToBounds = true
        isUserInteractionEnabled = true
    }
    
}
