//
//  SchemeHandler.swift
//  WebkitSample
//
//  Created by Lucas Paim on 21/11/2017.
//  Copyright © 2017 Lucas Paim. All rights reserved.
//

import Foundation
import WebKit

class SchemeHandler: NSObject, WKURLSchemeHandler, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    
    var task: WKURLSchemeTask?
    var controller: UIViewController?
    
    convenience init(controller: UIViewController) {
        self.init()
        self.controller = controller
    }
    
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        task = urlSchemeTask
        let photoPicker = UIImagePickerController()
        photoPicker.sourceType = .photoLibrary
        photoPicker.delegate = self
        controller?.present(photoPicker, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
        task = nil
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let data = UIImagePNGRepresentation(image)
        picker.dismiss(animated: true, completion: nil)
        task?.didReceive(URLResponse(url: task!.request.url!,
                                     mimeType: "image/png",
                                     expectedContentLength: data!.count, textEncodingName: nil))
        task?.didReceive(data!)
        task?.didFinish()
    }
    
}

