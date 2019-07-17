//
//  UserCreateViewController.swift
//  Hmmmm
//
//  Created by Anirban Kumar on 6/5/19.
//  Copyright © 2019 Anirban Kumar. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SwiftKeychainWrapper

class UserCreateViewController: UIViewController, UINavigationControllerDelegate {

    var userUid : String = ""
    var email : String = ""
    var password : String = ""
    
    @IBOutlet weak var completeButton : UIButton!
    @IBOutlet weak var userNameField : UITextField!

    var username : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func keychain(){
        KeychainWrapper.standard.set(userUid, forKey: "uid")
    }
    func setupUser() {
        username = userNameField.text as! String
        let userData = [
            "username"  : userNameField.text!   ,
            "email"     : email                 ,
            "pswd"      : password
        ]
        
        keychain()
        let setLocation = Database.database().reference().child("users").child(username).child(userUid)
        setLocation.setValue(userData)
        
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
    @IBAction func complete (_ sender : Any) {
        Auth.auth().createUser(withEmail: email, password: password, completion:
            { (user, error) in
                if error != nil {
                } else {
                    if let user = user {
                        self.userUid = user.user.uid
                    }
                }
                self.setupUser()
            })
    }
}
