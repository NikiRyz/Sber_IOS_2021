//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by 18267440 on 12.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTextField()
        self.createButton()
        self.setupView()
    }
     func setupView() {
         view.backgroundColor = .white

     }
    func createTextField(){
        self.textField.frame = CGRect(x: view.bounds.width / 2, y: view.bounds.width / 2, width: 250, height: 30)
        self.textField.center = self.view.center
        self.textField.borderStyle =    UITextField.BorderStyle.roundedRect
        self.textField.placeholder = "Поделись своими мыслями..."
        self.view.addSubview(self.textField)
    }
    func createButton(){
        self.buttonShare = UIButton(type: .roundedRect)
        self.buttonShare.frame = CGRect(x: 20, y: 300, width: 280, height: 44)
        self.buttonShare.setTitle("Поделиться с миром!", for: .normal )
        self.buttonShare.addTarget(self, action: #selector(hendleShare), for: .touchUpInside)
        self.view.addSubview(self.buttonShare)
    }
    @objc func hendleShare(paramSender: Any){
        let text = self.textField.text
        if (text?.count==0){
            let massage = "Напиши хоть что-нибудь"
            let alertController = UIAlertController(title: nil, message: massage, preferredStyle: .alert)
            let action = UIAlertAction(title: "Сейчас все будет", style: .cancel, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        let customActivity = CustomActivity(title: "В консоль"){(text)in print(text)}
        self.activityViewController = UIActivityViewController(activityItems: [self.textField.text ?? "nill"], applicationActivities: [customActivity])
        self.activityViewController?.excludedActivityTypes = [
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.saveToCameraRoll
        ]
        self.present(self.activityViewController!, animated: true, completion: nil)
    }
   
}

