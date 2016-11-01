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

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) -> Void in
          print(snapshot.value)
        })
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell()
        return tableView.dequeueReusableCell(withIdentifier: "FeedCell") as! FeedCell
    }
    
    @IBAction func signOutTapped(_ sender: UIButton) {
        KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("BEKAH: User removed")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignInVC", sender: nil)
    }
}
