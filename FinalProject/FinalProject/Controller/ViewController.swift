//
//  ViewController.swift
//  FinalProject
//
//  Created by 18267440 on 13.07.2021.
//

import UIKit

class ViewController: UIViewController {

    lazy var info: Label={
        let view = Label(text: "На случай важных переговоров")
        return view
    }()
    func myButton(){
        let button = UIButton(frame: CGRect(x: view.frame.size.width/2 - 80, y:
                                                view.frame.size.height/1.5, width: 160, height: 50))
        view.addSubview(button)
        button.setTitle("Начать!", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImageView(frame: CGRect(x: view.frame.size.width/2 - 100, y:
                                                view.frame.size.height/3.5, width: 200, height: 200))
        let url = URL(string:"https://media2.giphy.com/media/1j0LPmZFAekLWiQ0/200_d.gif?cid=e3b0c442c9f75367a3b4a3394939e98c3ab1a1ecebd35f15&rid=200_d.gif&ct=g")
            if let data = try? Data(contentsOf: url!)
            {
                img.image = UIImage(data: data)
            }
        img.contentMode = .scaleAspectFit
        self.view.addSubview(img)
        
        view.backgroundColor = .white
        myButton()
        view.addSubview(info)
        }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        info.center = view.center
        info.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-UIScreen.main.bounds.height/2)
    }

}

extension ViewController {
    @objc func buttonTapped() {
        let secondScreen = SecondScreen()
        navigationController?.pushViewController(secondScreen, animated: true)
    }
}
