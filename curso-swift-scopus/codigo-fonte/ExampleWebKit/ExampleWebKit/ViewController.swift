//
//  ViewController.swift
//  ExampleWebKit
//
//  Created by Danillo on 04/12/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate{

    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        
        let myURL = URL(string: "www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        webView.uiDelegate = self
        view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[webview]|", options: [], metrics: nil, views: ["webview": webView]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[webview]|", options: [], metrics: nil, views: ["webview": webView]))

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

