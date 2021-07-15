//
//  GifCell.swift
//  FinalProject
//
//  Created by 18267440 on 15.07.2021.
//

import UIKit

final class GifCell: UIImageView {
    
    static let id = "GifCell"
    
    
    private let view: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
//        model.data.images.fixedHeightSmall.url ??
        let url = URL(string:   "https://media3.giphy.com/media/xUNd9DbP7Jv9uHPa7e/100_s.gif?cid=e3b0c4424808e6bd2e26722ffc0b90ef11fb71b52cc206f9&rid=100_s.gif&ct=g")
            if let data = try? Data(contentsOf: url!)
            {
                view.image = UIImage(data: data)
            }
        addSubview(view)

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        view.frame = .init(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

