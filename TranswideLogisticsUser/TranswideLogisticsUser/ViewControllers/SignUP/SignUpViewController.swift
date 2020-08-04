//
//  SignUpViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import Firebase

class SignUpViewController: BaseViewController ,VerfiyNumberViewControllerDelegate{
   
    @IBOutlet weak var btnVerify: UIButton!
    
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var imgMobile: UIImageView!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblMobileno: UILabel!
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
     let userdefaults = UserDefaults.standard
    var isVerified : Bool = false
    @IBAction func actionSignUp(_ sender: Any) {
        
       if(checkValidation()){
              if(self.checkInternetConnection()){
                           self.getUserRegister(params: ["name" : self.txtfirstname.text,"email" : self.txtEmail.text,"profileImage" : "abcdefg","phoneNumber" : self.txtPhone.text,"address" : self.txtAddress.text,"fcmToken" : "5353535"])
                        }
             
              
          }
    }
    @IBAction func actionGetLocattion(_ sender: Any) {
        
        
        
    }
    
    @IBAction func actionShowSignIn(_ sender: Any) {
        self.showSignin()
   
    }
    override func checkInternetConnection() -> Bool {
        if(BReachability.isConnectedToNetwork()){
            return true
        }else{
            self.showAlertView(message:ERROR_NO_NETWORK, title: "Alert")
            return false
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func IsVerified(isVerified: Bool) {
        self.isVerified = true
        self.btnVerify.setTitle("Verfied", for: .normal)
       }
       
    

    @IBAction func actionVerify(_ sender: Any) {
        self.showOtpController()
    }
    
        func showOtpController(){
            
          if(self.txtPhone.text != nil){
                    PhoneAuthProvider.provider().verifyPhoneNumber(self.txtPhone.text!, uiDelegate: nil) { (verificationID, error) in
                                          if(error == nil){
                                              self.userdefaults.set(verificationID, forKey: "VerificationID")
                                              self.userdefaults.synchronize()
                                              if let vc = self.storyboard!.instantiateViewController(withIdentifier: "OtpViewController") as? OtpViewController{
                                                  vc.phoneNumber = self.txtPhone.text!
                                                vc.isFromSignUp = true
                                                vc.delegate = self
                        self.navigationController?.pushViewController(vc, animated: true)
                                              }
                                          }
                                          else{
                                              self.showAlertVIew(message: "Enable to send otp", title: "Tranwide User")
                                          }
                                      }
                                  }
                                  else{
                                      self.showAlertVIew(message: "Phone Numeber is Empty", title: "Transwide")
                                  }
    }
       func checkValidation() -> Bool {
            var message = ""
            var isValid = true
            if(self.txtPhone!.text!.isEmpty || self.txtEmail!.text!.isEmpty || self.txtAddress!.text!.isEmpty || self.txtfirstname!.text!.isEmpty || self.txtlastname!.text!.isEmpty){
                message = FILL_ALL_FIELDS_MESSAGE
                isValid = false
            }else if(!self.isValidEmail(testStr: self.txtEmail!.text!)){
                message = VALID_EMAIL_MESSAGE
                isValid = false
            }
            else if(!isVerified){
                message = "Please Verify Your Number First"
                isValid = false
        }
            if(!isValid){
                self.showAlertVIew(message: message, title: "Alert")
    //            self.createAlertViewMessagePopup(message: message)
    //            self.alertView?.show()
            }
            return isValid
        }
    
    func showSignin(){
       
        
                       if let vc = self.storyboard!.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
                                              
                                                self.navigationController?.pushViewController(vc, animated: true)
        }
        
                 
                  
              }
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


//MARK:- SIGN UP API

extension SignUpViewController{
    func getUserRegister(params : ParamsAny){
        self.startActivityWithMessage(msg: "")
                    GCD.async(.Background){
        LoginService.shared().getUserRegister(params: params) { (message, success, user) in
            GCD.async(.Main){
            self.stopActivity()
            if(success){
                Global.shared.user = user
                self.saveUserInfo(user!)
              let storyBoard = UIStoryboard(name: "Main", bundle: nil)
              if let vc = storyBoard.instantiateViewController(withIdentifier: "KYDrawerController") as? KYDrawerController{
                  self.navigationController?.pushViewController(vc, animated: true)
              }
            }
            else{
                self.isVerified = false
                self.btnVerify.setTitle("verify", for: .normal)
                self.showAlertVIew(message: message, title: "Transwide User")
            }
        }
    }
}
}
}
