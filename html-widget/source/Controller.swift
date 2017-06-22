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
    public var modelType:Message.Type = Model.self


    // MARK: - Private Properties
    var _messageInterface:MessageInterface?
    
    // MARK: - Properties
    public var name = "HTMLWidget"
    
    // MARK: - Public Functions
    public func channelView() -> UIView {
        return UIView()
    }
    
    public func configureWithMessageInterface(messageInterface:MessageInterface) {
        _messageInterface = messageInterface
    }

    public func channelViewPresentation() -> WidgetChannelPresentation {
        return WidgetChannelPresentation.Cell
    }
    
    public func configureChannelView(channelView:UIView, withMessage message:Message, presentingNavigationController navigationController:UINavigationController?) {
        let oTextView = channelView as? UILabel
        guard let textView = oTextView else {
            return;
        }
        textView.text = (message.contentJson["text"] != nil) ? (message.contentJson["text"] as? String): ""
    }

    public func updateChannelView(channelView:UIView, withData data:[String:Any]) {
        let oTextView = channelView as? UILabel
        guard let textView = oTextView else {
            return;
        }
        
        textView.text = (data["text"] != nil) ? (data["text"] as? String): ""
    }
    
    public func channelViewSizeForMessage(message: Message) -> CGSize {
        
        return CGSize(width: 300, height: 49+34*3+23)
    }
    
    public func composerViewControllerWith(send: @escaping (Message) -> (), cancel:  @escaping () -> ()) -> UIViewController {
        let composerViewController:ComposerViewController = UIStoryboard(name: "Composer", bundle: Bundle(for: Controller.self)).instantiateInitialViewController() as! ComposerViewController
        composerViewController.send = send
        composerViewController.cancel = cancel
        let navController = UINavigationController(rootViewController: composerViewController)
        return navController
    }
}
