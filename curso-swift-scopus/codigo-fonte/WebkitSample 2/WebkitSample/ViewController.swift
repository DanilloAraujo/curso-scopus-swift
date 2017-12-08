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
    
    var isLogged = false
    let domain = "10.20.32.232"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        reload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    func printAllCookies() {
        print("===========================")
        let cookieStore = webview.configuration.websiteDataStore.httpCookieStore
        cookieStore.getAllCookies { cookies in
            cookies.forEach {
                print("\($0)")
            }
        }
    }
    
    func loadWithCookie(cookieStore: WKHTTPCookieStore, cookie: HTTPCookie?, request: URLRequest) {
        cookieStore.setCookie(cookie!) { [weak self] in
            self?.webview.load(request)
            self?.printAllCookies()
        }
    }
    
    func removeCookie(cookieStore: WKHTTPCookieStore, cookie: HTTPCookie?, request: URLRequest) {
        cookieStore.delete(cookie!) {
            self.webview.load(request)
            self.printAllCookies()
        }
    }
    
    
    @IBAction func reload() {
        let urlRequest = URLRequest(url:
            URL(string: "http://\(domain)")!
        )
        
        let cookieStore = webview.configuration.websiteDataStore.httpCookieStore
        let cookie = HTTPCookie(properties:
            [
                HTTPCookiePropertyKey.domain : domain,
                HTTPCookiePropertyKey.path : "/",
                HTTPCookiePropertyKey.name: "SessionName",
                HTTPCookiePropertyKey.value: "José",
            ])
        
        if isLogged {
            loadWithCookie(cookieStore: cookieStore, cookie: cookie, request: urlRequest)
        } else {
            removeCookie(cookieStore: cookieStore, cookie: cookie, request: urlRequest)
        }
        
        isLogged = !isLogged
    }
    
    
}
