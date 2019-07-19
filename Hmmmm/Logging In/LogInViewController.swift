//
//  LogInViewController.swift
//  Hmmmm
//
//  Created by Anirban Kumar on 7/18/19.
//  Copyright © 2019 Anirban Kumar. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var ref = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logInTapped(_ sender: Any) {
        guard emailField.text != "" , passwordField.text != "" else { return }
        
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
            if error == nil {
                self.ref.child("user_profiles").child(user!.user.uid).child("handle").observeSingleEvent(of: .value, with: { (snapshot : DataSnapshot) in
                    if !snapshot.exists() {
                        self.performSegue(withIdentifier: "HandleViewSegue", sender: nil)
                    } else {
                        self.performSegue(withIdentifier: "HomeViewSegue", sender: nil)
                    }
                })
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
}
