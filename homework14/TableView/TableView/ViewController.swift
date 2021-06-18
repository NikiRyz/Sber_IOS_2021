//
//  ViewController.swift
//  TableView
//
//  Created by 18267440 on 15.06.2021.
//


import UIKit

final class ViewController: UIViewController {
    
    private var cities = [
        City(name: "Москва", isCheck: false),
        City(name: "Хабаровск", isCheck: false),
        City(name: "Воронеж", isCheck: false),
        City(name: "Владивосток", isCheck: false),
        City(name: "Казань", isCheck: false),
    ]
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(CityCell.self, forCellReuseIdentifier: CityCell.reuseID)
        table.tableFooterView = UIView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .purple
        title = "Мои путешествия"
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClick))
        navigationItem.rightBarButtonItem = addItem
        addItem.tintColor = .purple
        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func addButtonClick() {
        showAlert(title: "Enter") { cityName in
            self.addNewCity(name: cityName)
        }
    }
    
    private func addNewCity(name: String) {
        cities.append(City(name: name, isCheck: false))
        let indexPath = IndexPath(row: cities.count - 1, section: 0)
        table.insertRows(at: [indexPath], with: .middle)
        table.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    private func showAlert(title: String, complete: @escaping (String) -> Void) {
        let alert = UIAlertController(title: "Мои путешествия", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ок", style: .default) { (_) in
            if let cityName = alert.textFields?.first?.text, !cityName.isEmpty {
                complete(cityName)
            }
        }
        let cancel = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        alert.addTextField { (textField) in
            textField.placeholder = "Введите название города"
            textField.autocapitalizationType = .words
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.reuseID, for: indexPath) as! CityCell
        cell.set(city: cities[indexPath.row])
        cell.cellAction = { [weak self] cell in
            if let strongSelf = self,
               let indexPath = strongSelf.table.indexPath(for: cell) {
                strongSelf.cities[indexPath.row].isCheck.toggle()
                strongSelf.table.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityScreen = CityScreen()
        cityScreen.label.text = cities[indexPath.row].name
        navigationController?.pushViewController(cityScreen, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}



