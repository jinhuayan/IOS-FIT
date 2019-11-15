//
//  TutorialsViewController.swift
//  FitMe
//
//  Created by Jean on 2019-11-08.
//  Copyright © 2019 JJ. All rights reserved.
//

import UIKit
import WebKit
import AVKit

class TutorialsViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!
    var webViewLeg: WKWebView!
    var webViewBody: WKWebView!
    
    @IBOutlet weak var web: UIView!
    @IBOutlet weak var webLegs: UIView!
    @IBOutlet weak var webBody: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //arms
        webView = WKWebView(frame: web.frame, configuration: WKWebViewConfiguration() )
        self.web.addSubview(webView)
        self.webView.allowsBackForwardNavigationGestures = true
        let myURL = URL(string: "https://www.youtube.com/embed/hAGfBjvIRFI")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        
        //legs
        webViewLeg = WKWebView(frame: webLegs.frame, configuration: WKWebViewConfiguration() )
        self.webLegs.addSubview(webViewLeg)
        self.webViewLeg.allowsBackForwardNavigationGestures = true
        let legURL = URL(string: "https://www.youtube.com/embed/VhdXXqcoco0")
        let legRequest = URLRequest(url: legURL!)
        webViewLeg.load(legRequest)
        
        //body
        webViewBody = WKWebView(frame: webBody.frame, configuration: WKWebViewConfiguration() )
        self.webBody.addSubview(webViewBody)
        self.webViewBody.allowsBackForwardNavigationGestures = true
        let bodyURL = URL(string: "https://www.youtube.com/embed/UItWltVZZmE")
        let bodyRequest = URLRequest(url: bodyURL!)
        webViewBody.load(bodyRequest)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
