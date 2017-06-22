//
//  ChannelView.swift
//  Pods
//
//  Created by Anton Remizov on 6/21/17.
//
//

import UIKit
import WidgetKit

protocol ChannelViewDelegate {
    func buttonPressed(message:WidgetMessage?);
}

class ChannelView: UIView {
    public let button = UIButton(type: UIButtonType.custom)
    public var delegate:ChannelViewDelegate?
    var _message:WidgetMessage?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(button)
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: UIControlEvents.touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = self.bounds.insetBy(dx: 10, dy: 10)
    }

    func configure(message:WidgetMessage) {
        _message = message
        let model = message.widgetModel as! Model
        button.setTitle("Increase: \(model.value)", for: UIControlState.normal)
    }

    func buttonTapped(sender:AnyObject) {
        delegate?.buttonPressed(message: _message)
    }
}
