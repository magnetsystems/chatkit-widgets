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
    public var items:[Bool] = []

    override public var contentJson: [String : Any] {
        get {
            var json = super.contentJson
            json["items"] = items
            return json
        }
    }

    required public init(json:[String:Any]) {
        super.init(json: json)
        items = json["items"] as? [Bool] ?? []
    }

    required public init() {
        super.init(name:"Checklist")
        items = [true, false, false]
    }
}
