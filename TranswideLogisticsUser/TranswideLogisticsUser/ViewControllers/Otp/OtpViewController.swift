//
//  OtpViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class OtpViewController: UIViewController {

    @IBOutlet weak var lblOtp: UILabel!
    @IBOutlet weak var lblEnterOtpCode: UILabel!
    
   
    @IBOutlet weak var lblOtpTimer: UILabel!
    @IBOutlet weak var lblResend: UILabel!
    @IBOutlet weak var tfborder4: UITextField!
    @IBOutlet weak var tfborder3: UITextField!
    @IBOutlet weak var tfborder2: UITextField!
    @IBOutlet weak var tfborder1: UITextField!
    @IBOutlet weak var txtOtpcode4: UITextField!
    @IBOutlet weak var txtOtpcode3: UITextField!
    @IBOutlet weak var txtOtpcode2: UITextField!
    @IBOutlet weak var txtOtpcode1: UITextField!
    
    
    @IBAction func actionSubmit(_ sender: Any) {
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
