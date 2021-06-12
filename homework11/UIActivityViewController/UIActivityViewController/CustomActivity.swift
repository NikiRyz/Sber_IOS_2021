//
//  CustomActivity.swift
//  UIActivityViewController
//
//  Created by 18267440 on 12.06.2021.
//

import UIKit

class CustomActivity: UIActivity {
    

    var customActivityType: UIActivity.ActivityType
    var activityItems: [Any] = []
    var activityName: String
    var activityTapped: ([Any]) -> Void
    
    init(title: String,  performAction: @escaping ([Any]) -> Void) {
        self.activityName = title
        self.customActivityType = UIActivity.ActivityType(rawValue: "Action \(title)")
        self.activityTapped = performAction
        super.init()
    }
    
    override var activityType: UIActivity.ActivityType? {
        return customActivityType
    }
    
    override var activityTitle: String? {
        return activityName
    }
    
    override class var activityCategory: UIActivity.Category {
        return .share
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        self.activityItems = activityItems
    }
    
    override func perform() {
        activityTapped([activityItems])
    }
}
