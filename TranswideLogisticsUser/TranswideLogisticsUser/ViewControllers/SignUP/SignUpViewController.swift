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

class SignUpViewController: BaseViewController {

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
    
    @IBAction func actionSignUp(_ sender: Any) {
        
       if(checkValidation()){
              if(self.checkInternetConnection()){
                            self.showOtpController()
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
    

        
        func showOtpController(){
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                   if let vc = storyboard!.instantiateViewController(withIdentifier: "OtpViewController") as? OtpViewController{
                    vc.phoneNumber
                        = self.txtPhone.text!
                    vc.signUpcheck = 1
                    
                    self.navigationController?.pushViewController(vc, animated: true)
            
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
            if(!isValid){
                self.showAlertVIew(message: message, title: "Alert")
    //            self.createAlertViewMessagePopup(message: message)
    //            self.alertView?.show()
            }
            return isValid
        }
    
    func showSignin(){
        
        
                  let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                         if let vc = storyboard!.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
                        
                          
                          self.navigationController?.pushViewController(vc, animated: true)
                  
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

}
