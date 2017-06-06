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
    public var name = "Checklist"
    
    // MARK: - Public Functions
    public func channelView() -> UIView {
        return ChecklistView.checklistView()
    }
    
    public func channelViewPresentation() -> WidgetChannelPresentation {
        return WidgetChannelPresentation.Cell
    }
    
    public func configureChannelView(channelView:UIView, withData data:[String:Any], presentingNavigationController navigationController:UINavigationController?) {
        let oTextView = channelView as? UILabel
        guard let textView = oTextView else {
            return;
        }
        
        textView.text = (data["text"] != nil) ? (data["text"] as? String): ""
    }

    public func updateChannelView(channelView:UIView, withData data:[String:Any]) {
        let oTextView = channelView as? UILabel
        guard let textView = oTextView else {
            return;
        }
        
        textView.text = (data["text"] != nil) ? (data["text"] as? String): ""
    }
    

    
    public func channelViewSizeForData(data:[String : Any]) -> CGSize {
        
        return CGSize(width: 300, height: 49+34*3+23)
    }
    
    public func composerViewControllerWith(send: @escaping ([String : Any]) -> (), cancel:  @escaping () -> ()) -> UIViewController {
        let composerViewController:ComposerViewController = UIStoryboard(name: "Composer", bundle: Bundle(for: Controller.self)).instantiateInitialViewController() as! ComposerViewController
        composerViewController.send = send
        composerViewController.cancel = cancel
        let navController = UINavigationController(rootViewController: composerViewController)
        return navController
    }

}
