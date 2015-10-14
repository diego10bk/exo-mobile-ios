//
//  defines.swift
//  eXoHybrid
//
//  Created by Nguyen Manh Toan on 10/7/15.
//  Copyright © 2015 eXo. All rights reserved.
//

import Foundation


struct Config {
    static let baseURL:String =  "http://192.168.1.67:8080"
}

struct ShareExtension {
    static let USERNAME:String =  "exo_share_username"
    static let PASSWORD:String =  "exo_share_password"
    static let DOMAIN:String =  "exo_share_domain"
    static let ALL_ACCOUNTS:String =  "exo_share_all_usernames"
    static let SELECTED_ACCOUNT_INDEX:String =  "exo_share_selected_account_index"
}

struct Cookies {
    static let username:String =  "last_login_username"
    static let domain:String =  "last_login_username"    
}
