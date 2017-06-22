//
//  MessageRoutingController.swift
//  ChatKit
//
//  Created by Anton Remizov on 5/8/17.
//  Copyright © 2017 Magnet Systems. All rights reserved.
//
//

import UIKit
import WidgetKit

let label = UILabel()

public class Controller: WidgetControllerBase, WidgetKit.ChannelWidgetPresenting {
    
    var _interactionInterface: WidgetInteractionInterface?
    
    override public func configureWithInteractionInterface(interactionInterface:WidgetInteractionInterface) {
        _interactionInterface = interactionInterface
    }

    public override init() {
        super.init()
        name = "TextWidget"
        modelType = Model.self
        registerPresenter(presenter: self, forSurface:WidgetKit.WidgetSurface.Channel.rawValue)
    }

    // MARK: - ChannelWidgetPresenting

    public func widgetViewPresentation() -> WidgetChannelPresentation {
        return WidgetChannelPresentation.Cell
    }

    public func widgetView() -> UIView {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.white
        view.backgroundColor = UIColor.clear
        return view
    }

    public func configureWidgetView(widgetView:UIView, withMessage message:WidgetMessage, presentingNavigationController navigationController:UINavigationController?) {
        let oTextView = widgetView as? UILabel
        guard let textView = oTextView else {
            return;
        }
        let model:Model? = message.widgetModel as? Model
        let text:NSString = (model?.text ?? "") as NSString
        textView.text = text as String

        let size = textView.text?.size(attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14.0)])
        let frame = CGRect(x:0, y:0, width:(size?.width)!, height:(size?.height)!)
        textView.sizeToFit()
    }

    public func widgetViewSizeForMessage( message:WidgetMessage ) -> CGSize {
        let model:Model? = message.widgetModel as? Model
        let text:NSString = (model?.text ?? "") as NSString
        let size = text.size(attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14.0)])
        return CGSize(width: size.width + 10, height: size.height + 10)
    }

    public func containerCellTypeForMessage( message:WidgetMessage ) -> WidgetContainerCell.Type {
        return WidgetContainerCell.self
    }
}
