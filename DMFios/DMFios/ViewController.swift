//
//  ViewController.swift
//  DMFios
//
//  Created by lago on 12/22/15.
//  Copyright (c) 2015 Lago Sound Software LLC. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(FBSDKAccessToken.currentAccessToken() == nil)
        {
            print("User Not Logged IN")
        } else
        {
            let setupProfPage = self.storyboard?.instantiateViewControllerWithIdentifier("SetupProfilePageViewController") as! SetupProfilePageViewController
            
            let setupProfPageNav = UINavigationController(rootViewController: setupProfPage)
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = setupProfPageNav
        }
        
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile","email","user_friends"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        if(error != nil)
        {
            print(error.localizedDescription)
            return
        }
        
        if let userToken = result.token
        {
            //Get the user access token
            let token:FBSDKAccessToken = result.token
            
            print("Token = \(FBSDKAccessToken.currentAccessToken().tokenString)")
            print("UserID = \(FBSDKAccessToken.currentAccessToken().userID)")
            
            let setupProfPage = self.storyboard?.instantiateViewControllerWithIdentifier("SetupProfilePageViewController") as! SetupProfilePageViewController
            
            let setupProfPageNav = UINavigationController(rootViewController: setupProfPage)
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = setupProfPageNav
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        print("User is logged out")
    }
    
}

