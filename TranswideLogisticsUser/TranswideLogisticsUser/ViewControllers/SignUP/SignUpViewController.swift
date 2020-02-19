//
//  SignUpViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var imgProfile: UIButton!
    @IBOutlet weak var imgMobile: UIImageView!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblMobileno: UILabel!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var imgPassword: UIImageView!
    @IBOutlet weak var lblConfirmPassword: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var imgConfirmPassword: UIImageView!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var imgEmail: UIImageView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var txtfirstname: UITextField!
    @IBOutlet weak var txtlastname: UITextField!
    @IBOutlet weak var lblfirstname: UILabel!
    @IBOutlet weak var lblLastname: UILabel!
    @IBOutlet weak var lblProfilepic: UILabel!
    @IBOutlet weak var btnGetLocation: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var lblAlreadyMember: UILabel!
    @IBOutlet weak var btnSignIn: UIButton!
    
    @IBAction func actionSignUp(_ sender: Any) {
    }
    @IBAction func actionGetLocattion(_ sender: Any) {
    }
    
    @IBAction func actionShowSignIn(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
