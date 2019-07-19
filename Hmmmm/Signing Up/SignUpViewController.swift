//
//  SignUpViewController.swift
//  Hmmmm
//
//  Created by Anirban Kumar on 7/17/19.
//  Copyright © 2019 Anirban Kumar. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import FirebaseCore

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var ref : DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isEnabled = false
        
        ref = Database.database().reference()
    }

    
    @IBAction func nextTapped(_ sender: Any) {
        guard emailField.text != "", passwordField.text != "" , confirmPasswordField.text != "" else {return}
        nextButton.isEnabled = false
        if passwordField.text == confirmPasswordField.text  {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    Auth.auth().signIn(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                        if error == nil {
                            self.ref?.child("user_profiles").child(user!.user.uid).child("email").setValue(self.emailField.text!)

                            self.performSegue(withIdentifier: "HandleViewSegue", sender: nil)
                        }
                    })
                }
            }
        }
    }
    
    @IBAction func textDidChange(_ sender: UITextField) {
        if emailField.text!.count > 0 && passwordField.text == confirmPasswordField.text && passwordField.text!.count > 0 {
            nextButton.isEnabled = true
        }
    }
}
