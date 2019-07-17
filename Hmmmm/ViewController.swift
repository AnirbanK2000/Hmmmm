//
//  ViewController.swift
//  Hmmmm
//
//  Created by Anirban Kumar on 6/5/19.
//  Copyright © 2019 Anirban Kumar. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var userUid : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: "uid") {
            goToFeed()
        }
    }
    
    func goToCreateVC(){
        performSegue(withIdentifier: "signUp", sender: nil)
    }
    func goToFeed() {
        print(KeychainWrapper.standard.string(forKey: "uid"))
        performSegue(withIdentifier: "toFeed", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UserCreateViewController {
            if segue.identifier == "signUp"{
                if userUid != nil {
                    destination.userUid = userUid
                }
                if emailField.text != nil {
                    destination.email = emailField.text as! String
                }
                if passwordField.text != nil {
                    destination.password = passwordField.text as! String
                }
            }
        }
    }
    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text , let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion:
                { (user, error) in
                    if error == nil {
                        if let user = user {
                            self.userUid = user.user.uid
                            KeychainWrapper.standard.set(self.userUid, forKey: "uid")
                            self.goToFeed()
                        }
                    } else {
                        self.goToCreateVC()
                    }
                })
        }
    }
    
}
