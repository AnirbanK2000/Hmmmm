//
//  MainFeedViewController.swift
//  Hmmmm
//
//  Created by Anirban Kumar on 6/6/19.
//  Copyright © 2019 Anirban Kumar. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableview: UITableView!
    
    var databaseRef = Database.database().reference()
    var loggedInUser : AnyObject?
    var loggedInUserData : AnyObject?
    
    var posts = [AnyObject?]()
    
    @IBOutlet weak var aivLoading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.separatorStyle = .none
        tableview.allowsSelection = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.loggedInUser = Auth.auth().currentUser
        self.databaseRef.child("user_profiles").child(self.loggedInUser!.uid).observeSingleEvent(of: .value) { (snapshot : DataSnapshot) in
            self.loggedInUserData = snapshot
            print("HELLOOOOOOOOOOOOOOO")
            self.databaseRef.child("posts/\(self.loggedInUser!.uid)").observeSingleEvent(of: .childAdded, with: { (snapshot2 : DataSnapshot) in
                print("HELLOOOOOOOOOOOOOOO 22222222")
                self.posts.append(snapshot2)
                print("")
                print("")
                print("")
                print("")
                print(snapshot2)
                print("")
                print("")
                print("")
                print("")
                self.tableview.insertRows(at: [IndexPath (row: 0, section: 0)], with: .automatic)
                print("HELLOOOOOOOOOOOOOOO 33333333")

                self.aivLoading.stopAnimating()
            }) {(error) in
                print("whatttt")
                print(error.localizedDescription)
            }
        }
    }
    @IBAction func postTapped(_ sender: Any) {
        print("hello")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFour", for: indexPath as IndexPath) as? FourOptionsTableViewCell
        
        let post = posts[(self.posts.count - 1) - indexPath.row]?.value(forKey: "text") as! String

        cell?.configure(profilePic: nil, user: self.loggedInUserData?.value(forKey: "handle") as! String, question: post)
//        cell?.questionLabel.text = "To enjoy good health, to bring true happiness to one's family, to bring peace to all, one must first discipline and control one's own mind. If a man can control his mind he can find the way to Enlightenment, and all wisdom and virtue will naturally come to him."
        
        return cell!
    }
    
}


