//
//  eXoWebBaseViewController.swift
//  eXoHybrid
//
//  Created by Nguyen Manh Toan on 9/30/15.
//  Copyright © 2015 eXo. All rights reserved.
//

import UIKit
import WebKit

class EXoWebBaseViewController: UIViewController, WKNavigationDelegate {
    var webView:WKWebView?
    var platformURL:String?
    
    @IBOutlet weak var webViewContainer: UIView!
    @IBOutlet weak var loading_indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let wkWebViewConfiguration = WKWebViewConfiguration()
        let contentController = WKUserContentController()
        let source = "document.getElementById(\"NavigationPortlet\").style.color = \"gray\";"
        let script = WKUserScript(source: source, injectionTime: .AtDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(script)
        wkWebViewConfiguration.userContentController = contentController
        webView = WKWebView (frame:CGRectOffset(self.view.bounds,0,0), configuration: wkWebViewConfiguration)
        webView?.navigationDelegate = self;
        let url = NSURL(string: platformURL!)
        let request = NSURLRequest(URL: url!)
        webView?.loadRequest(request)
        self.webViewContainer.addSubview(webView!)
//        let constraints = [NSLayoutConstraint(item: webView!, attribute: .Leading, relatedBy: .Equal, toItem: self.webViewContainer, attribute: .Leading, multiplier: 1, constant: 0), NSLayoutConstraint(item: webView!, attribute: .Top, relatedBy: .Equal, toItem: self.webViewContainer, attribute: .Top, multiplier: 1, constant: 0),  NSLayoutConstraint(item: webView!, attribute: .Trailing, relatedBy: .Equal, toItem: self.webViewContainer, attribute: .Trailing, multiplier: 1, constant: 0), NSLayoutConstraint(item: webView!, attribute: .Bottom, relatedBy: .Equal, toItem: self.webViewContainer, attribute: .Bottom, multiplier: 1, constant: 0)]
//        self.webViewContainer.addConstraints(constraints)
        self.webViewContainer.layoutIfNeeded()
        loading_indicator.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK : WKWebViewDelegate
    func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!) {
        let javascript = "var meta = document.createElement('meta');meta.setAttribute('name', 'viewport');meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no');document.getElementsByTagName('head')[0].appendChild(meta);"
        webView.evaluateJavaScript(javascript, completionHandler: nil)
    }
    func webView(webView: WKWebView, didReceiveAuthenticationChallenge challenge: NSURLAuthenticationChallenge, completionHandler: (NSURLSessionAuthChallengeDisposition, NSURLCredential?) -> Void) {
        print("didReceiveAuthenticationChallenge")
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        print("finished")
        loading_indicator.stopAnimating()
    }
    
    func webViewWebContentProcessDidTerminate(webView: WKWebView) {
        print(webView.estimatedProgress)
        
    }
    
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        print(error)
    }
    
}
