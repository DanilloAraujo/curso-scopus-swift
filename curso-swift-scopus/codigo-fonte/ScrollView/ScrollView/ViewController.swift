//
//  ViewController.swift
//  ScrollView
//
//  Created by Danillo on 04/12/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > scrollView.contentSize.height / 4 {
            lblText.backgroundColor = UIColor.blue
        } else {
            lblText.backgroundColor = UIColor.green
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return lblText
    }
}

