//
//  ViewController.swift
//  Social Media App
//
//  Created by Rebekah Baker on 10/26/16.
//  Copyright © 2016 Rebekah Baker. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }

    @IBAction func facebookBtnTapped(_ sender: RoundButton) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("BEKAH: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("BEKAH: User cancelled Facebook authentication")
            } else {
                print("BEKAH: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuthenticate(credential)
            }
        }
    }
    
    func firebaseAuthenticate(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("BEKAH: Unable to authenticate with Firebase - \(error)")
            } else {
                print("BEKAH: Successfully autheticated with FIrebase")
            }
        })
    }
}

