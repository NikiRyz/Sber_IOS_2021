//
//  CityScreen.swift
//  TableView
//
//  Created by 18267440 on 15.06.2021.
//

import UIKit

final class CityScreen: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(label)
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
