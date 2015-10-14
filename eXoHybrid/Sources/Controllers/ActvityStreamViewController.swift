//
//  ActvityStreamViewController.swift
//  eXoHybrid
//
//  Created by Nguyen Manh Toan on 9/30/15.
//  Copyright © 2015 eXo. All rights reserved.
//

import UIKit

class ActvityStreamViewController: EXoWebBaseViewController {

    @IBOutlet weak var shareButton: UIButton!
    override func viewDidLoad() {
        self.platformURL = Config.baseURL + "/portal/intranet"
        
        super.viewDidLoad()
        
        Tool_Objective_C.shareExtensionSave()
        
        self.shareButton.layer.cornerRadius = self.shareButton.frame.size.width/2
        self.shareButton.layer.shadowColor = UIColor.redColor().CGColor
        self.shareButton.layer.shadowOffset = CGSizeMake(-1,3)
        
        
        var groupUserDefaults = NSUserDefaults(suiteName: "group.com.exoplatform.mob.eXoPlatformiPHone")
        groupUserDefaults?.setFloat(1.25, forKey: "test")
        print (groupUserDefaults?.synchronize())
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateAccountInfoForShareExtension () {

        let accounts = [["username":"toan", "password":"123456", "serverURL":"192.168.1.67:8080", "accountName": "local"]]
        var userDefaults = NSUserDefaults.init(suiteName: "group.com.exoplatform.mob.eXoPlatformiPHone")
        userDefaults!.setObject(accounts, forKey: ShareExtension.ALL_ACCOUNTS)

        for cookie:NSHTTPCookie in (NSHTTPCookieStorage.sharedHTTPCookieStorage().cookies)! {
            print(cookie.description)
            if (cookie.name == Cookies.username) {
                NSUserDefaults.standardUserDefaults().setValue(cookie.value, forKey: ShareExtension.USERNAME)
            }
        }
        
    }
    
    @IBAction func shareAction(sender: AnyObject) {
        
        let url = NSURL(string: self.platformURL!)
        var request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "HEAD"
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse?, data:NSData?, error:NSError?) -> Void in
            let s = String (data: data!, encoding: NSUTF8StringEncoding)
            print(s)
        };
        
        var username:String?
        for cookie:NSHTTPCookie in (NSHTTPCookieStorage.sharedHTTPCookieStorage().cookies)! {
            print(cookie.description)

            if (cookie.name == "last_login_username") {
                username = cookie.value
            }
            
        }
        
        let messageComposerNavi:UINavigationController = self.storyboard?.instantiateViewControllerWithIdentifier("NavigationMessageComposerController") as! UINavigationController
        let messageComposerVC:MessageComposerViewController = messageComposerNavi.viewControllers.last as! MessageComposerViewController
        
        messageComposerVC.username = username
        self.presentViewController(messageComposerNavi, animated: true) { () -> Void in
            
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
