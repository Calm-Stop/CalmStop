//
//  ProfileViewController.swift
//  CalmStopOfficer
//
//  Created by Douglas MacbookPro on 3/15/17.
//  Copyright © 2017 Douglas MacbookPro. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var ethnicityLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        checkIfUserIsLoggedIn()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkIfUserIsLoggedIn(){
        if FIRAuth.auth()?.currentUser?.uid == nil {
            print("Not logged in!")
        } else {
            let uid = FIRAuth.auth()?.currentUser?.uid
            FIRDatabase.database().reference().child("officer").child("14567").child(uid!).child("profile").observeSingleEvent(of: .value, with: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String: AnyObject]{
                    let first_name = dictionary["first_name"] as? String
                    let last_name = dictionary["last_name"] as? String
                    let email = dictionary["email"] as? String
                    let phone_number = dictionary["phone_number"] as? String
                    let gender = dictionary["gender"] as? String
                    let badge_number = dictionary["badge_number"] as? String
                    
                    self.nameLabel.text = (first_name! + " ") + (last_name  ?? " ")
                    self.emailLabel.text = email ?? " "
                    self.phoneLabel.text = phone_number ?? " "
                    self.genderLabel.text = gender ?? " "
                    self.numberLabel.text = badge_number ?? " "
                }
                
                print (snapshot)
            })
        }
    }

}
