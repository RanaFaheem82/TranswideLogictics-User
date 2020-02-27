//
//  OtpViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Firebase
class OtpViewController: BaseViewController {

    @IBOutlet weak var lblOtp: UILabel!
    @IBOutlet weak var lblEnterOtpCode: UILabel!
    @IBOutlet weak var tfOtpCode: OTPtextField!
    var phoneNumber:String = ""
   
   var userdefaults = UserDefaults()
    
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
         self.AuthenticatePhone()
          tfOtpCode.configure(with: 6)
          tfOtpCode.didEnterLastdigit = { [weak self] code in
              print(code)
              
          }
      }
    
    @IBAction func actionSubmit(_ sender: Any) {
        guard let otpCode = tfOtpCode.text else  { return }
        guard let verficationId = userdefaults.string(forKey: "VerificationID") else { return }
        let credetials = PhoneAuthProvider.provider().credential(withVerificationID: verficationId, verificationCode: otpCode)
        
        Auth.auth().signInAndRetrieveData(with: credetials) { (success, error) in
            if(error == nil){
                print("USER LOGED IN")
                self.showHomeVC()
                
            }else{
                
                print("WRONG")
            }
            
        }
       }
  
    func AuthenticatePhone(){
      PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNumber, uiDelegate: nil) { (verificationId, error) in
                 if error == nil{
                  guard let verifyId = verificationId  else { return }
                  self.userdefaults.set(verifyId, forKey: "VerificationID")
                  self.userdefaults.synchronize()
                 }else{
                     print("unable to get secret id from f as Anyirebase",error?.localizedDescription as Any)
                 }
             }
      }
    func showHomeVC(){
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
               if let vc = storyboard!.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController{
                                 
                self.navigationController?.pushViewController(vc, animated: true)
                                        
    }
    }

}
