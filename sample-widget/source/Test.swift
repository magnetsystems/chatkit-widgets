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

public class Test: NSObject, ChatKit.WidgetControlling {

    // MARK: - Properties
    public var name = "SampleWidget"
    
    // MARK: - Public Functions
    public func channelView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.backgroundColor = UIColor.red
        return view
    }
    
    public func channelViewPresentation() -> WidgetChannelPresentation {
        return WidgetChannelPresentation.Cell
    }

    public func configureChannelView(channelView:UIView, withData data:[String : Any], presentingNavigationController navigationController:UINavigationController?) {
    }
    
    public func channelViewSizeForData(data:[String : Any]) -> CGSize {

        return CGSize(width: 100, height: 100)
    }

    public func composerViewControllerWith(send: @escaping ([String : Any]) -> (), cancel:  @escaping () -> ()) -> UIViewController {
        let navController = UINavigationController(rootViewController: ComposerViewController(send: send, cancel: cancel))
        return navController
    }
}
