//
//  SetupProfilePageViewController.swift
//  DMFios
//
//  Created by lago on 12/28/15.
//  Copyright © 2015 Lago Sound Software LLC. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class SetupProfilePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutButtonTapped(sender: AnyObject) {
        
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        
        let loginPage = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        let loginPageNav = UINavigationController(rootViewController: loginPage)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = loginPageNav
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
