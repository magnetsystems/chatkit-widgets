//
//  Model.swift
//  Pods
//
//  Created by Anton Remizov on 6/7/17.
//
//

import UIKit
import WidgetKit

class Model: WidgetModel {
    var value:Int = 0
    
    override var contentJson: [String : Any] {
        get {
            var json = super.contentJson
            json["value"] = value
            return json
        }
    }
    required public init(json:[String:Any]) {
        super.init(json: json)
        value = json["value"] as? Int ?? 0
    }
    
    required public init() {
        super.init(name:"SampleWidget")
    }
}
