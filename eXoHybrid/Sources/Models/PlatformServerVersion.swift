//
//  PlatformServerVersion.swift
//  eXoHybrid
//
//  Created by Nguyen Manh Toan on 10/5/15.
//  Copyright © 2015 eXo. All rights reserved.
//

import UIKit

class PlatformServerVersion: NSObject {

    
    var platformVersion:String? // Version of the Platform (3.0 or 3.5 or higher)
    var platformRevision:String? // Revision of the Platform

    var platformBuildNumber:String?
    var isMobileCompliant:String?
    var platformEdition:String?
    
    var currentRepoName:String?
    var defaultWorkSpaceName:String?
    var userHomeNodePath:String?
    
}
