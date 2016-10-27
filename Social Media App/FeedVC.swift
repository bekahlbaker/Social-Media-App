//
//  FeedVC.swift
//  Social Media App
//
//  Created by Rebekah Baker on 10/27/16.
//  Copyright © 2016 Rebekah Baker. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func signOutTapped(_ sender: UIButton) {
        KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("BEKAH: User removed")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignInVC", sender: nil)
    }
}
