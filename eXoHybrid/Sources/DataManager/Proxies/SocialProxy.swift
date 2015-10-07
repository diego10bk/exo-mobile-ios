//
//  SocialProxy.swift
//  eXoHybrid
//
//  Created by Nguyen Manh Toan on 10/5/15.
//  Copyright © 2015 eXo. All rights reserved.
//

import UIKit

class SocialProxy: NSObject {
    var delegate:SocialProxyDelegate?
}


protocol SocialProxyDelegate {
    func proxyDidFinishLoading(proxy:SocialProxy)
    func proxy(proxy:SocialProxy, didFailWithError error:NSError)

}

