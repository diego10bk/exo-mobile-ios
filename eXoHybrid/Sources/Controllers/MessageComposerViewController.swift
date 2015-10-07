//
//  MessageComposerViewController.swift
//  eXoHybrid
//
//  Created by Nguyen Manh Toan on 10/6/15.
//  Copyright © 2015 eXo. All rights reserved.
//

import UIKit

class MessageComposerViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addPhotoButton: UIButton!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var attachImageView: UIImageView!
    
    var username:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelAction(sender: AnyObject) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
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
