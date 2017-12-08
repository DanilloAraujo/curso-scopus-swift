//
//  ViewController.swift
//  WebkitSample
//
//  Created by Lucas Paim on 20/11/2017.
//  Copyright © 2017 Lucas Paim. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let urlRequest = URLRequest(url:
            URL(string: "https://www.google.com.br")!
        )
        webview.load(urlRequest)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
