//
//  ViewController.swift
//  apiDisplay
//
//  Created by HengVisal on 4/25/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let lbl = UILabel()
    let publicSub = PublishSubject<apiResult>()
    
        override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.white
        lbl.frame = CGRect(x:0,y:0,width: 420,height: 1000)
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.numberOfLines = 43
        lbl.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.view.addSubview(self.lbl)
            
        apiService.shared.apiPostRequest { (response) in
            self.publicSub.map{ response in String(describing: response) }
                .bind(to: self.lbl.rx.text)
            self.publicSub.subscribe()
            self.publicSub.onNext(response)
            }
    
        
    }
}

