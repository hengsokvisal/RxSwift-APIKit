//
//  ViewController.swift
//  apiDisplay
//
//  Created by HengVisal on 4/25/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let lbl = UILabel()
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
        view.backgroundColor = UIColor.white
        lbl.frame = CGRect(x:0,y:0,width: 420,height: 1000)
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.numberOfLines = 43
        lbl.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        apiService.shared.apiPostRequest { (response) in
            var api : apiResult
            api = response
            self.lbl.text = String(describing: api)
            }
        self.view.addSubview(self.lbl)
    }
}

