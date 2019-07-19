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
    //var loggedInUserData : AnyObject?
    
    var loggedInUserData = NSDictionary()
    var posts = NSDictionary()
    
    @IBOutlet weak var aivLoading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.separatorStyle = .none
        tableview.allowsSelection = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.loggedInUser = Auth.auth().currentUser
        self.databaseRef.child("user_profiles").child(self.loggedInUser!.uid).observeSingleEvent(of: .value) { (snapshot : DataSnapshot) in
            self.loggedInUserData = snapshot.value as! NSDictionary
            
            self.databaseRef.child("posts").child(self.loggedInUser!.uid).observe(.childAdded, with: { (snap : DataSnapshot) in
                
                self.posts = snap.value as! NSDictionary

                self.tableview.insertRows(at: [IndexPath (row: 0, section: 0)], with: .automatic)
                
                self.aivLoading.stopAnimating()
                
            }) {(error) in
                print(error.localizedDescription)
            }
        }
        
    }
    
    func fetchPosts(){
        
    }
    
    @IBAction func postTapped(_ sender: Any) {

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFour", for: indexPath as IndexPath) as? FourOptionsTableViewCell
//
        //let post = posts[indexPath.row]!.value(forKey: "text") as! String
        let post = posts.object(forKey: "text")
        let name = loggedInUserData.object(forKey: "handle")
        
        cell?.configure(/*profilePic: nil,*/ user: name as! String, question: post as! String)
        
//        cell?.questionLabel.text = "To enjoy good health, to bring true happiness to one's family, to bring peace to all, one must first discipline and control one's own mind. If a man can control his mind he can find the way to Enlightenment, and all wisdom and virtue will naturally come to him."
        
        return cell!
    }
    
}


