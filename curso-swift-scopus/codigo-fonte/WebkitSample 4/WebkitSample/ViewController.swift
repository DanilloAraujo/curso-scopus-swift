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

    weak var webview: WKWebView?
    
    let domain = "10.20.32.232"
    let scheme = "sample-app"
    
//    var schemeHandler: SchemeHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let customConfig = WKWebViewConfiguration()
        customConfig.setURLSchemeHandler(SchemeHandler(controller: self), forURLScheme: scheme)

        
        let webView = WKWebView(frame: self.view.frame, configuration: customConfig)
        self.webview = webView
        
        self.view = webView
        
        let urlRequest = URLRequest(url: URL(string: "http://\(domain)")!)
        webview?.load(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
