//
//  Label.swift
//  FinalProject
//
//  Created by 18267440 on 13.07.2021.
//

import UIKit

final class Label: UIView{
    private let textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    convenience init(text: String) {
        self.init(frame: .zero)
        textLabel.text = text
        addSubview(textLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.center = center
        textLabel.frame = .init(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
}
