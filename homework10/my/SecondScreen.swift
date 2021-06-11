//
//  SecondScreen.swift
//  my
//
//  Created by 18267440 on 11.06.2021.
//

import UIKit

final class SecondScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        let imageViewBackground = UIImageView(frame: CGRect(x:0, y:0, width: width, height: height))
           imageViewBackground.image = UIImage(named: "donuts")
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.addSubview(imageViewBackground)
        self.view.sendSubviewToBack(imageViewBackground)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
