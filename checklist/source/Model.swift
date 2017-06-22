//
//  Model.swift
//  Pods
//
//  Created by Anton Remizov on 6/7/17.
//
//

import UIKit
import ChatKit

class Model: WidgetModel {
    required public init(json:[String:Any]) {
        super.init(json: json)
        widgetName = "Checklist"
    }
}
