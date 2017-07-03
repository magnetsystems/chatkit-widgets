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

//@objc public protocol ControllerDelegate : NSObjectProtocol {
//    func checklistView(checklistView:ChecklistView, didTapItemAtIndex index:Int, updateMessage message:WidgetMessage);
//}

public class Controller: WidgetControllerBase, WidgetKit.ChannelWidgetCreating, WidgetKit.ChannelWidgetPresenting, ChecklistViewDelegate, FlatSurfaceWidgetPresenting {
    
    public override init() {
        super.init()
        name = "Checklist"
        modelType = Model.self

        registerPresenter(presenter: self, forSurface:WidgetKit.WidgetSurface.Channel.rawValue)
        registerPresenter(presenter: self, forSurface:WidgetKit.WidgetSurface.Creator.rawValue)
        registerPresenter(presenter: self, forSurface:WidgetKit.WidgetSurface.Flat.rawValue)
    }

    // MARK: - ChannelWidgetPresenting
    
    public func widgetViewPresentation() -> WidgetChannelPresentation {
        return WidgetChannelPresentation.Cell
    }

    public func widgetView() -> UIView {
        let view : ChecklistView? = UINib(nibName: "ChecklistView", bundle: Bundle(for: self.classForCoder)).instantiate(withOwner: nil, options: nil).first as! ChecklistView?
        return view!
    }
 
    public func configureWidgetView(widgetView:UIView, withMessage message:WidgetMessage, presentingNavigationController navigationController:UINavigationController?) {
        let view = widgetView as! ChecklistView
        let model = message.widgetModel as? Model
        view.configure(message: message)

        view.frame = CGRect(x: 0, y: 0, width: 200, height: 13 + 49 + 34 * (model?.items.count)!)
        view.delegate = self
    }

    public func widgetViewSizeForMessage( message:WidgetMessage ) -> CGSize {
        let model = message.widgetModel as? Model
        return CGSize(width: 100, height: 13 + 49 + 34 * (model?.items.count)!)
    }

    public func containerCellTypeForMessage( message:WidgetMessage ) -> WidgetContainerCell.Type {
        return WidgetContainerCell.self
    }

    // MARK: - ChannelWidgetCreating

    public func composerViewControllerWith(send: @escaping (WidgetModel) -> (), cancel: @escaping () -> ()) -> UIViewController {
        let navController = UINavigationController(rootViewController: ComposerViewController(send: send, cancel: cancel))
        return navController
    }

    public var composerTitle:String {
        get {
            return "Checklist"
        }
    }

    // MARK: - ChecklistViewDelegate

    func checklistView(checklistView:ChecklistView, didTapItemAtIndex index:Int, updateMessage message:WidgetMessage?) {
        let model = checklistView.model
        var items = (model?.items)!
        items[index] = !(items[index])
        model?.items = items
        if message != nil {
            interactionInterface?.updageWidget(widget: message!, withModel: model!)
        }
    }

    // MARK: - FlatSurfaceWidgetPresenting

    public func configureWidgetView(widgetView:UIView, withModel model:WidgetModel, presentingNavigationController navigationController:UINavigationController?) {
        let view = widgetView as! ChecklistView

        let model:Model? = model as? Model
        view.configureWithModel(model: model!)
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 13 + 49 + 34 * (model?.items.count)!)
        view.delegate = self
    }

    public func widgetViewSizeForModel( model:WidgetModel ) -> CGSize {
        let model:Model? = model as? Model
        return CGSize(width: 200, height: 13 + 49 + 34 * (model?.items.count)!)
    }
}
