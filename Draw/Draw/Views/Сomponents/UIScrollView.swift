//
//  UIScrollView.swift
//  Draw
//
//  Created by 18267440 on 04.07.2021.
//

import UIKit

extension UIScrollView {
    func screenCenterXOffset(for offset: CGPoint? = nil) -> CGFloat {
        let offsetX = offset?.x ?? contentOffset.x
        let contentOffsetX = offsetX + bounds.width / 2

        return contentOffsetX
    }
}
