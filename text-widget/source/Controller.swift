//
//  MessageRoutingController.swift
//  ChatKit
//
//  Created by Anton Remizov on 5/8/17.
//  Copyright © 2017 Magnet Systems. All rights reserved.
//
//

import UIKit
import ChatKit

let label = UILabel()

public class Controller: NSObject, ChatKit.WidgetControlling {

    // MARK: - Properties
    public var name = "TextWidget"
    
    // MARK: - Public Functions
    public func channelView() -> UIView {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.backgroundColor = UIColor.blue
        return view
    }
    
    public func channelViewPresentation() -> WidgetChannelPresentation {
        return WidgetChannelPresentation.Cell
    }
    
    public func configureChannelView(channelView:UIView, withData data:[String:Any], presentingNavigationController navigationController:UINavigationController?) {
        let oTextView = channelView as? UILabel
        guard let textView = oTextView else {
            return;
        }
        
        textView.text = (data["text"] != nil) ? (data["text"] as? String) : ""
    }
    
    public func channelViewSizeForData(data: [String : Any]) -> CGSize {
        let text:NSString = ((data["text"] != nil) ? data["text"] : "") as! NSString
        let size = text.size(attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14.0)])
        return CGSize(width: size.width + 10, height: 45)
    }
}
