//
//  OtpViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Firebase
class OtpViewController: UIViewController {

    @IBOutlet weak var lblOtp: UILabel!
    @IBOutlet weak var lblEnterOtpCode: UILabel!
    @IBOutlet weak var tfOtpCode: OTPtextField!
    
   var userdefaults = UserDefaults()
     var alertView = CustomIOSAlertView()
    
    
    
    @IBAction func actionSubmit(_ sender: Any) {
        guard let otpCode = tfOtpCode.text else  { return }
        guard let verficationId = userdefaults.string(forKey: "VerificationID") else { return }
        let credetials = PhoneAuthProvider.provider().credential(withVerificationID: verficationId, verificationCode: otpCode)
        
        Auth.auth().signInAndRetrieveData(with: credetials) { (success, error) in
            if(error == nil){
                print("USER LOGED IN")
            }else{
                
                print("WRONG")
            }
            
        }
        
        
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        tfOtpCode.configure(with: 6)
        tfOtpCode.didEnterLastdigit = { [weak self] code in
            
            print(code)
            self?.alertView = CustomIOSAlertView()
            self!.alertView?.buttonTitles = nil
            self!.alertView?.useMotionEffects = true
          
            
        }
        

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
