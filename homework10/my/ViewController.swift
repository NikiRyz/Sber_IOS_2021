//
//  ViewController.swift
//  my
//
//  Created by 18267440 on 11.06.2021.
//

import UIKit

class ViewController: UIViewController {
    private lazy var buttonNext: UIButton = {
        let size: CGFloat = 60
        let button = UIButton(frame: CGRect(x: view.bounds.width / 2 - size / 2,
                                            y: view.bounds.height / 2 - size / 2,
                                            width: size,
                                            height: size))
        button.backgroundColor = .white
        button.layer.cornerRadius = size / 2
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configurateNavBar()
    }
}
extension ViewController {
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(buttonNext)
        configurateDonutView()
    }
    private func configurateDonutView() {
        let donutRadius: CGFloat = 120
        let innerRadius: CGFloat = 60

        let donut = DonutView(x: view.bounds.width / 2 - donutRadius,
                              y: view.bounds.height / 2 - donutRadius,
                              donutRadius: donutRadius,
                              holeRadius: innerRadius,
                              with: UIImage(named: "donut"))
        view.addSubview(donut)
    }
    private func configurateNavBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
extension ViewController {
    @objc func buttonTapped() {
        let secondScreen = SecondScreen()
        navigationController?.pushViewController(secondScreen, animated: true)
    }
}

