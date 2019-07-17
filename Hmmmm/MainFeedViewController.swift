//
//  MainFeedViewController.swift
//  Hmmmm
//
//  Created by Anirban Kumar on 6/6/19.
//  Copyright © 2019 Anirban Kumar. All rights reserved.
//

import UIKit

class MainFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let example = ["This is the first cell","And I am the second, which is better.. So much better to be honesty","Pshhhtttt third's the best","Quit arguing. Sincerly, the fourth","weirdos"]

    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.separatorStyle = .none
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return example.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath as IndexPath) as? CustomCell{
            cell.stuffLabel.text = example[indexPath.row]
            
            cell.option1.layer.cornerRadius = 10
            cell.option2.layer.cornerRadius = 10
            cell.option3.layer.cornerRadius = 10
            cell.option4.layer.cornerRadius = 10
            
            cell.option1.layer.masksToBounds = true
            cell.option2.layer.masksToBounds = true
            cell.option3.layer.masksToBounds = true
            cell.option4.layer.masksToBounds = true
            
            return cell
        }
        return UITableViewCell()
        
    }
    
    
    
}

class CustomCell: UITableViewCell{
    @IBOutlet weak var stuffLabel: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
}
