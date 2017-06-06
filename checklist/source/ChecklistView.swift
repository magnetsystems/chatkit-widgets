//
//  ChecklistView.swift
//  Pods
//
//  Created by Anton Remizov on 6/2/17.
//
//

import UIKit

@available(iOS 9.0, *)
class ChecklistView: UIView {

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
        stack.addArrangedSubview(ChecklistItem.checklistItem())
        stack.addArrangedSubview(ChecklistItem.checklistItem())
        stack.addArrangedSubview(ChecklistItem.checklistItem())
    }
}
