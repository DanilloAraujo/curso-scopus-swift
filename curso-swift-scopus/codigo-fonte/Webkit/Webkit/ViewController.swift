//
//  ViewController.swift
//  Webkit
//
//  Created by Danillo on 04/12/2017.
//  Copyright © 2017 Danillo. All rights reserved.
//

import UIKit
//import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //create subviews
        let topBar = UIView()
        let middleFrameTop = UIView()
        let middleFrameBottom = UIView()
        let bottomBar = UIView()
        
        //set background colors of the views
        topBar.backgroundColor = UIColor.gray
        middleFrameTop.backgroundColor = UIColor.orange
        middleFrameBottom.backgroundColor = UIColor.blue
        bottomBar.backgroundColor = UIColor.gray
        
        //add subviews to superview
        self.view.addSubview(topBar)
        self.view.addSubview(middleFrameTop)
        self.view.addSubview(middleFrameBottom)
        self.view.addSubview(bottomBar)
        
        //remove any constraints in interface builder
        topBar.translatesAutoresizingMaskIntoConstraints = false
        middleFrameTop .translatesAutoresizingMaskIntoConstraints = false
        middleFrameBottom.translatesAutoresizingMaskIntoConstraints = false
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        
        //build dinctionary of views
        let viewsDict = ["topBar": topBar,
                         "middleFrameTop": middleFrameTop ,
                         "middleFrameBottom": middleFrameBottom,
                         "bottomBar": bottomBar];
        
        //build array to store constraints
        var viewConstraints = [NSLayoutConstraint]()
        
        //creates vertical constraints
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[topBar(>=20,<=50)]-16-[middleFrameTop]-16-[middleFrameBottom(==middleFrameTop)]-16-[bottomBar(==topBar)]-20-|", options: [], metrics: nil, views: viewsDict)
        viewConstraints += verticalConstraints
        
        //creates horizontal constraints
        let topBarConstraintsHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[topBar]-16-|", options: [], metrics: nil, views: viewsDict)
        viewConstraints += topBarConstraintsHorizontal
        let middleFrameTopHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[middleFrameTop]-16-|", options: [], metrics: nil, views: viewsDict)
        viewConstraints += middleFrameTopHorizontal
        let middleFrameBottomHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[middleFrameBottom]-16-|", options: [], metrics: nil, views: viewsDict)
        viewConstraints += middleFrameBottomHorizontal
        let bottomBarHorizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[bottomBar]-16-|", options: [], metrics: nil, views: viewsDict)
        viewConstraints += bottomBarHorizontal
        //active all constraints
        NSLayoutConstraint.activate(viewConstraints)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

