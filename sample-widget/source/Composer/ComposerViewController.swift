//
//  ComposerViewController.swift
//  Pods
//
//  Created by Anton Remizov on 5/10/17.
//
//

import UIKit
import WidgetKit

class ComposerViewController: UIViewController {

    private var _send:((WidgetModel) -> ())?
    private var _cancel:(() -> ())?
    
    init(send: @escaping (WidgetModel) -> (), cancel: @escaping () -> ()) {
        _send = send
        _cancel = cancel
        super.init(nibName: nil, bundle: nil);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Send", style: UIBarButtonItemStyle.plain, target: self, action: #selector(send))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(cancel))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func send() {
        self.navigationController?.dismiss(animated: true, completion: nil);
        if let send = _send {
            send(Model())
        }
    }
    
    func cancel() {
        self.navigationController?.dismiss(animated: true, completion: nil);
        if let cancel = _cancel {
            cancel()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
