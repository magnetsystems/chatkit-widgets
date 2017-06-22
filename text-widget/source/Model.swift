//
//  Model.swift
//  Pods
//
//  Created by Anton Remizov on 6/7/17.
//
//

import UIKit
import WidgetKit

public class Model: WidgetModel {
    public var text:String = ""
    
    override public var contentJson: [String : Any] {
        get {
            var json = super.contentJson
            json["text"] = text
            return json
        }
    }
    
    required public init(json:[String:Any]) {
        super.init(json: json)
        text = json["text"] as? String ?? ""
    }
    
    required public init() {
        super.init(name:"TextWidget")
    }
}
