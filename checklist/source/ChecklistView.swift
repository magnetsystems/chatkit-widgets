//
//  ChecklistView.swift
//  Pods
//
//  Created by Anton Remizov on 6/2/17.
//
//

import UIKit
import WidgetKit

protocol ChecklistViewDelegate {
    func checklistView(checklistView:ChecklistView, didTapItemAtIndex index:Int, updateMessage message:WidgetMessage?);
}

@available(iOS 9.0, *)
class ChecklistView: UIView {

    private var _message:WidgetMessage?
    public private(set) var model:Model?
    var delegate: ChecklistViewDelegate!
    @IBOutlet var title: UILabel!
    @IBOutlet var stack: UIStackView!
    
    public static func checklistView() -> ChecklistView {
        let view:ChecklistView = UINib(nibName: "ChecklistView", bundle: Bundle(for: self)).instantiate(withOwner: nil, options: nil).first as! ChecklistView
        return view
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
    }
    
    public func configure(message:WidgetMessage) {
        _message = message

        for view in stack.arrangedSubviews {
            stack.removeArrangedSubview(view)
        }
        
        self.model = model as! Model
        let count = self.model?.items.count as! Int
        for index in 0..<count {
            let item = self.model?.items[index]
            let checklistItem = ChecklistItem.checklistItem()
            checklistItem.imageView.image = UIImage(named: item! ? "checkmark_icon_selected.png" : "checkmark_icon.png",
                                                    in: Bundle(for:self.classForCoder),
                                                    compatibleWith: nil)
            checklistItem.tapCallback = {
                self.delegate?.checklistView(checklistView:self, didTapItemAtIndex:index, updateMessage: self._message!);
            }
            stack.addArrangedSubview(checklistItem)
        }
    }
    
    public func configureWithModel(model:WidgetModel) {
        for view in stack.arrangedSubviews {
            stack.removeArrangedSubview(view)
        }

        self.model = model as! Model
        let count = self.model?.items.count as! Int
        for index in 0..<count {
            let item = self.model?.items[index]
            let checklistItem = ChecklistItem.checklistItem()
            checklistItem.imageView.image = UIImage(named: item! ? "checkmark_icon_selected.png" : "checkmark_icon.png",
                                                    in: Bundle(for:self.classForCoder),
                                                    compatibleWith: nil)
            checklistItem.tapCallback = {
                self.delegate?.checklistView(checklistView:self, didTapItemAtIndex:index, updateMessage: self._message);
            }
            stack.addArrangedSubview(checklistItem)
        }
    }
}
