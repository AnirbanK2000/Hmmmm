//
//  FourOptionsTableViewCell.swift
//  Hmmmm
//
//  Created by Anirban Kumar on 7/18/19.
//  Copyright © 2019 Anirban Kumar. All rights reserved.
//

import UIKit


class FourOptionsTableViewCell : UITableViewCell {
    //@IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var cardView : UIView!
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    override public func awakeFromNib() {
        //stuff
    }
    
    public func configure(/*profilePic: String? ,*/ user: String? , question: String?){
        self.questionLabel.text = question
        self.usernameLabel.text = user
        
//        if profilePic != nil {
//            let imageData = NSData(contentsOf: NSURL(string: profilePic!) as! URL)
//            self.profilePicture.image = UIImage(data: imageData as! Data)
//
//        } else {
//            self.profilePicture.image = UIImage(named: "user")
//        }
//
        //ADD ANSWER BUTTON TEXT HERE
    }
    
}
