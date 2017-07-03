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

public class Controller: WidgetControllerBase, WidgetKit.ChannelWidgetCreating, WidgetKit.ChannelWidgetPresenting, ChannelViewDelegate, FlatSurfaceWidgetPresenting {

    var _interactionInterface: WidgetInteractionInterface?
    
    override public func configureWithInteractionInterface(interactionInterface:WidgetInteractionInterface) {
        _interactionInterface = interactionInterface
    }

    public override init() {
        super.init()
        name = "SampleWidget"
        modelType = Model.self
        registerPresenter(presenter: self, forSurface:WidgetKit.WidgetSurface.Channel.rawValue)
        registerPresenter(presenter: self, forSurface:WidgetKit.WidgetSurface.Creator.rawValue)
        registerPresenter(presenter: self, forSurface:WidgetKit.WidgetSurface.Flat.rawValue)
    }

    // MARK: - ChannelWidgetPresenting

    func buttonPressed(message:WidgetMessage?) {
        let model = message?.widgetModel as! Model
        let newModel = Model()
        newModel.value = (model.value ?? 0) + 1
//        let message = WidgetMessage(json: nil, widgetModel: newModel)
//        _interactionInterface?.sendMessage(message: message)
        
        _interactionInterface?.updageWidget(widgetId: (message?.id)!, withModel: newModel)
    }
 
    // MARK: - ChannelWidgetPresenting
    
    public func widgetViewPresentation() -> WidgetChannelPresentation {
        return WidgetChannelPresentation.Cell
    }
    
    public func widgetView() -> UIView {
        let view = ChannelView(frame:CGRect.zero)
        view.delegate = self
        return view
    }

    public func configureWidgetView(widgetView:UIView, withMessage message:WidgetMessage, presentingNavigationController navigationController:UINavigationController?) {
        let view = widgetView as! ChannelView
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        view.configure(message: message)
    }

    public func widgetViewSizeForMessage( message:WidgetMessage ) -> CGSize {
        return CGSize(width: 200, height: 50)
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
            return "Counter"
        }
    }

    // MARK: - FlatSurfaceWidgetPresenting
    
    public func configureWidgetView(widgetView:UIView, withModel model:WidgetModel, presentingNavigationController navigationController:UINavigationController?) {
        let view = widgetView as! ChannelView
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        view.configureWithModel(model: model)
    }
    
    public func widgetViewSizeForModel( model:WidgetModel ) -> CGSize {
        return CGSize(width: 200, height: 50)
    }
}
