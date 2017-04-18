//
//  PopUpViewController.swift
//  CalmStopOfficer
//
//  Created by Douglas MacbookPro on 4/12/17.
//  Copyright © 2017 Douglas MacbookPro. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBAction func ClosePopUp(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var documentPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(PopUpViewController.dismissPopUp))
        downSwipe.direction = .down
        view.addGestureRecognizer(downSwipe)
            
        documentPhoto.image = photo
        documentPhoto.transform = documentPhoto.transform.rotated(by: CGFloat(-M_PI_2))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissPopUp(){
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
