//
//  LocationViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class LocationViewController: BaseViewController{

    
    @IBOutlet weak var lblpreviousDetails: UILabel!
    
    @IBOutlet weak var lblpreviousInfo: UILabel!
    @IBOutlet weak var viewPreviouslocation: UIView!
    @IBOutlet weak var lblViewtext: UITextView!
    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var viewMap: UIView!
    @IBOutlet weak var destinationView: UIView!
    @IBOutlet weak var pickupView: UIView!
    @IBOutlet weak var tfDestination: UITextField!
    @IBOutlet weak var tfPickupPoint: UITextField!
    
    @IBAction func actionClearDestination(_ sender: Any) {
    }
    
    
    @IBAction func actionClearPickUp(_ sender: Any) {
    }
    
    
    @IBAction func actionSubmit(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainContainer?.setMenuButton()
        self.mainContainer?.setTitle(title: "Home")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
