//
//  Pictures.swift
//  Draw
//
//  Created by 18267440 on 04.07.2021.
//

import UIKit

final class Pictures {
    private(set) var image: UIImage
    var name: String
    
    init(with image: UIImage, name: String = "") {
        self.image = image
        self.name = name
    }
    
    func set( image: UIImage, name: String = "") {
        self.image = image
        self.name = name
    }
}
