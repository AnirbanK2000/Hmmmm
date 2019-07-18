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

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let picker = UIImagePickerController()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var userStorage : StorageReference?
    var ref : DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        
        let storage = Storage.storage().reference(forURL: "gs://polled-f87e2.appspot.com/")
        userStorage = storage.child("users")
        
        ref = Database.database().reference()
    }
    @IBAction func selectPictureTapped(_ sender: Any) {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageView.image = image
            nextButton.isHidden = false
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        guard nameField.text != "" , emailField.text != "", passwordField.text != "" , confirmPasswordField.text != "" else {return}
        if passwordField.text == confirmPasswordField.text  {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                if let user = user {
                    
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = self.nameField.text
                    changeRequest?.commitChanges(completion: nil)
                    
                    let imageReference = self.userStorage?.child("\(user.user.uid).jpg")
                    let data = self.imageView.image!.jpegData(compressionQuality: 0.5)
                    let uploadTask = imageReference?.putData(data!, metadata: nil, completion: { (metadata, err) in
                        if err != nil {
                            print(err!.localizedDescription)
                        }
                        imageReference?.downloadURL(completion: { (url, error) in
                            if error != nil {
                                print(error!.localizedDescription)
                            }
                            if let url = url {
                                let userInfo : [String : Any] = ["uid" : user.user.uid ,
                                                                 "full name" : self.nameField.text! ,
                                                                 "email" : self.emailField.text! ,
                                                                 "urlToImage" : url.absoluteString]
                            
                                
                                Auth.auth().signIn(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                                    if error == nil { self.ref?.child("user_profiles").child(user!.user.uid).setValue(userInfo)
                                        self.performSegue(withIdentifier: "HandleViewSegue", sender: nil)
                                    }
                                })
                                
//                                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                                let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoggedIn") //as! MainFeedViewController
//
//                                self.present(newViewController, animated: true, completion: nil)
//
                            }
                        })
                    })
                    uploadTask?.resume()
                }
            }
        } else {
            print("Pass dont match")
        }
    }
}
