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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logInTapped(_ sender: Any) {
        guard emailField.text != "" , passwordField.text != "" else { return }
        
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
            if let error = error {
                print("hello")
                print(error.localizedDescription)
            }
            if let user = user {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoggedIn") //as! MainFeedViewController
                
                self.present(newViewController, animated: true, completion: nil)
            }
        }
    }
    
}
