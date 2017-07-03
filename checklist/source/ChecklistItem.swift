//
//  ChecklistItem.swift
//  Pods
//
//  Created by Anton Remizov on 6/2/17.
//
//

import UIKit

class ChecklistItem: UIView {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleView: UILabel!
    var tapCallback: (()->())?

    public static func checklistItem() -> ChecklistItem {
        return UINib(nibName: "ChecklistItem", bundle: Bundle(for: self)).instantiate(withOwner: nil, options: nil).first as! ChecklistItem
    }
    @IBAction func checkmarkTapped(_ sender: Any) {
        if let callback = tapCallback {
            callback()
        }
    }
}
