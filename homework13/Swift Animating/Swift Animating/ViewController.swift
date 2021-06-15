//
//  ViewController.swift
//  Swift Animating
//
//  Created by 18267440 on 15.06.2021.
//

import UIKit

class ViewController: UIViewController {
    let shape = CAShapeLayer()
    var button = UIButton()
    private let label : UILabel={
        let label = UILabel()
        label.textAlignment = .center
        label.text = "100%"
        label.textColor = .black
        label.font = .systemFont(ofSize: 36)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        label.sizeToFit()
        label.center = view.center
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 100, startAngle: -.pi/2, endAngle: .pi*2, clockwise: true)
        view.backgroundColor = .white
        shape.path = circlePath.cgPath
        shape.lineWidth = 20
        shape.strokeColor = UIColor.systemPurple.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
  
        
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.lineWidth = 20
        trackShape.strokeColor = UIColor.lightGray.cgColor
        trackShape.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(trackShape)
        view.layer.addSublayer(shape)
        button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height-70, width: view.frame.size.width-40, height: 50))
        button.setTitle("Поехали!", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(button)    }
    @objc func fireTimer() {
        print("Timer fired!")
    }
    @objc func didTapButton(){
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    label.alpha = 0
    button.alpha = 0
    animation.toValue = 1
    animation.duration = 2
    animation.isRemovedOnCompletion = false
    animation.fillMode = .forwards
    shape.add(animation, forKey: "animation")
        Timer.scheduledTimer(withTimeInterval: 1.8, repeats: false) { [self] timer in
            self.button.alpha = 1
            label.alpha = 1
            view.addSubview(label)
           }
    }
}

