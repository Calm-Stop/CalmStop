//
//  InitialContactViewController.swift
//  CalmStopCitizen
//
//  Created by Annisa Karaca on 5/16/17.
//  Copyright © 2017 Calm Stop. All rights reserved.
//

import UIKit
import Firebase

class InitialContactViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var officerNameLabel: UILabel!
    @IBOutlet weak var badgeNumberLabel: UILabel!
    @IBOutlet weak var deptNumberLabel: UILabel!
    @IBOutlet weak var requestText: UITextView!
    @IBOutlet weak var officerImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadOfficerInfo()
    }
    
    func loadOfficerInfo() {
        // hard-coded officer ID
        let officerUID = "Tl4pCcIjlxTXQgCcoLp4IB4Hzti2"
        let officerDept = "14567"
    
        FIRDatabase.database().reference().child("officer").child(officerDept).child(officerUID).child("profile").observeSingleEvent(of: .value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]{
                print(dictionary)
                let firstName = dictionary["first_name"] as? String
                let lastName = dictionary["last_name"] as? String
                let badgeNumber = dictionary["badge"] as? String
                let deptNumber = dictionary["department"] as? String
                
                
                self.officerNameLabel.text = "Officer " + firstName! + " " + lastName!
                self.badgeNumberLabel.text = "Badge #" + badgeNumber!
                self.deptNumberLabel.text = "Dept #" + deptNumber!
                self.requestText.text = "Officer " + lastName! + " has made a traffic stop and is requesting the license, insurance, and vehicle registration from the driver."
            }
            
        })

    }
    
}



