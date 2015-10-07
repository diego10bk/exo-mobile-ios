//
//  LoginViewController.swift
//  eXoHybrid
//
//  Created by Nguyen Manh Toan on 9/30/15.
//  Copyright © 2015 eXo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var urlTextBox: UITextField!
    @IBOutlet weak var usernameTextBox: UITextField!
    
    @IBOutlet weak var passwordTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlTextBox.text = "http://192.168.1.67:8080"
        
        usernameTextBox.text = "toan"
        passwordTextBox.text = "123456"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        sessionConfig.HTTPAdditionalHeaders = ["Authorization":""]
        
        let session  = NSURLSession(configuration: sessionConfig)
        
        
        let stringURL = self.urlTextBox.text! + "/rest/private/platform/info#"
        let url = NSURL(string: stringURL)
        
        
        let request = NSMutableURLRequest(URL: url!)
        //set default request timeout = 100 ms.
        request.timeoutInterval = 100
        request.HTTPMethod = "GET"
        request.setValue("eXo Hybrid App", forHTTPHeaderField:"User-Agent")
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if (error != nil) {
                let s = String(data: data!, encoding: NSUTF8StringEncoding)
                print(s)
                let statusCode = (response as! NSHTTPURLResponse).statusCode
                if(statusCode >= 200 && statusCode < 300) {
                    do {
                        let platfromServerVersion = PlatformServerVersion()
                        let jsonObjects = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? NSDictionary
                        
                        platfromServerVersion.platformVersion = jsonObjects?.objectForKey("platformVersion") as? String
                        platfromServerVersion.platformRevision  = jsonObjects?.objectForKey("platformRevision") as? String
                        platfromServerVersion.platformBuildNumber = jsonObjects?.objectForKey("platformBuildNumber") as? String
                        platfromServerVersion.isMobileCompliant = jsonObjects?.objectForKey("isMobileCompliant") as? String
                        platfromServerVersion.platformEdition = jsonObjects?.objectForKey("platformEdition") as? String
                        platfromServerVersion.currentRepoName = jsonObjects?.objectForKey("currentRepoName") as? String
                        platfromServerVersion.defaultWorkSpaceName = jsonObjects?.objectForKey("defaultWorkSpaceName") as? String
                        platfromServerVersion.userHomeNodePath  = jsonObjects?.objectForKey("userHomeNodePath") as? String
                        print(platfromServerVersion)
                    } catch {
                    }
                }
            } else {
                
            }
        }
        task.resume()
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
