//
//  CityCell.swift
//  TableView
//
//  Created by 18267440 on 15.06.2021.
//

import UIKit

final class CityCell: UITableViewCell {

    static var reuseID: String { return self.description() }
    var cellAction: ((CityCell) -> Void)?
    
     private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var chekButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(checkButtonPress), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(cityNameLabel)
        contentView.addSubview(chekButton)
        NSLayoutConstraint.activate([
            cityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cityNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            chekButton.centerYAnchor.constraint(equalTo: cityNameLabel.centerYAnchor),
            chekButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func checkButtonPress() {
        cellAction?(self)
    }
    
    func set(city: City) {
        cityNameLabel.text = city.name
        contentView.backgroundColor = city.isCheck ? .purple : .white
        let image = UIImage(systemName: city.isCheck ? "checkmark.circle" : "circle")
        chekButton.setImage(image, for: .normal)
    }
}
