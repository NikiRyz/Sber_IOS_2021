//
//  MainView.swift
//  Draw
//
//  Created by 18267440 on 04.07.2021.
//

import UIKit

final class MainView {
    
    static var pictures: [Pictures] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13].map { Pictures(with: UIImage(named: "\($0)")!)
       }
    
    static func createMainView() -> DrawingsVC {
           let view = DrawingsView()
           let controller = DrawingsVC(with: view)
           view.delegate = controller
           return controller
       }
    static func pushDrawingcVC() {
            let delegate = UIApplication.shared.delegate?.window!
            guard let window = delegate else { return }
            
            window.rootViewController = UINavigationController(rootViewController: MainView.createMainView())
            
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: {}, completion:
            { completed in
                if let statusBarFrame = window.windowScene?.statusBarManager?.statusBarFrame {
                    Const.statusBarHeight = statusBarFrame.height
                    let statusBarBackgroundView = UIView(frame: statusBarFrame)
                    window.addSubview(statusBarBackgroundView)
                    statusBarBackgroundView.backgroundColor = .white
                }
            })
        }
}



