//
//  LoginProxy.swift
//  eXoHybrid
//
//  Created by Nguyen Manh Toan on 10/5/15.
//  Copyright © 2015 eXo. All rights reserved.
//

import UIKit
class LoginProxy: NSObject {
    var delegate :LoginProxyDelegate?
    
    
}


protocol LoginProxyDelegate {
    
    func loginProxy(loginProxy:LoginProxy, platformVersionCompatibleWithSocialFeatures compatibleWithSocial:Bool, withServerInformation platformServerVersion:PlatformServerVersion)
    
    func loginProxy(loginProxy:LoginProxy, authenticateFailedWithError error:NSError)
    
}
