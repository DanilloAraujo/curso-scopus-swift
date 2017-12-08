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
    
    let sites = ["https://www.google.com.br", "https://www.facebook.com", "https://www.apple.com/"]
    var currentWebsite = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        compileRules()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func compileRules() {
        WKContentRuleListStore.default().compileContentRuleList(forIdentifier: "MyBlock",
                                                                encodedContentRuleList: loadFromBundle()!) { [weak self] rules, error in
            self?.loadWebsite()
        }
    }

    func loadWebsite() {
        WKContentRuleListStore.default().lookUpContentRuleList(forIdentifier: "MyBlock", 
                                                               completionHandler: { [weak self] rules, error in

            if error != nil { return }
            self?.webview.configuration.userContentController.add(rules!)
            
            if let currentWebsite = self?.currentWebsite, let sites = self?.sites {
                let request = URLRequest(url: URL(string: sites[currentWebsite])!)
                self?.webview.load(request)
            }
            
        })
    }
    
    func loadFromBundle() -> String? {
        if let path = Bundle.main.path(forResource: "content-filter", ofType: "json") {
            guard let jsonFileContent = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) else { fatalError("Rule list doesn't exist!") }
            return jsonFileContent
        }
        return nil
    }
    
    @IBAction func next() {
        currentWebsite = min(sites.count - 1, currentWebsite + 1)
        loadWebsite()
    }
    
    @IBAction func back() {
        currentWebsite = max(0, currentWebsite - 1)
        loadWebsite()
    }
    
}
