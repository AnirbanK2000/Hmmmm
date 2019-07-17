//
//  MainFeedViewController.swift
//  Hmmmm
//
//  Created by Anirban Kumar on 6/6/19.
//  Copyright © 2019 Anirban Kumar. All rights reserved.
//

import UIKit

class MainFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let example = ["This is the first cell santos ","To enjoy good health, to bring true happiness to one's family, to bring peace to all, one must first discipline and control one's own mind. If a man can control his mind he can find the way to Enlightenment, and all wisdom and virtue will naturally come to him.","Quit arguing. Sincerly, the fourth", "Pshhhtttt third's the best","weirdos"]

    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.separatorStyle = .none
        tableview.allowsSelection = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    @IBAction func postTapped(_ sender: Any) {
        print("hello")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return example.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath as IndexPath) as? CustomFourOptions , indexPath.row%3 == 1 {
            cell.questionLabel.text = example[indexPath.row]
            
            return cell
        }
        if let cell2 = tableView.dequeueReusableCell(withIdentifier: "customCell2", for: indexPath as IndexPath) as? CustomThreeOptions , indexPath.row%3 == 2 {
            cell2.questionLabel.text = example[indexPath.row]
            
            return cell2
        }
        if let cell3 = tableView.dequeueReusableCell(withIdentifier: "customCell3", for: indexPath as IndexPath) as? CustomTwoOptions , indexPath.row%3 == 0 {
            cell3.questionLabel.text = example[indexPath.row]
                        
            return cell3
        }
        return UITableViewCell()
    }
    
}

class CustomFourOptions : UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var cardView : UIView!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
}

class CustomThreeOptions : UITableViewCell {
    @IBOutlet weak var questionLabel : UILabel!
    @IBOutlet weak var cardView : UIView!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
}
class CustomTwoOptions : UITableViewCell {
    @IBOutlet weak var questionLabel : UILabel!
    @IBOutlet weak var cardView : UIView!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
}
