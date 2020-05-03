//
//  LoginViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: BaseViewController {
    @IBOutlet weak var lblsignIn: UILabel!
    @IBOutlet weak var imgPhone: UIImageView!
    @IBOutlet weak var txtphone: UITextField!
    @IBOutlet weak var lblphone: UILabel!
    @IBOutlet weak var imgApplogo: UIImageView!
    let userdefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        txtphone.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    @IBAction func actionShowSignup(_ sender: Any) {
        self.showSignup()
    }
    @IBAction func actionLogin(_ sender: Any) {
        if(self.txtphone.text != nil){
            PhoneAuthProvider.provider().verifyPhoneNumber(self.txtphone.text!, uiDelegate: nil) { (verificationID, error) in
                if(error == nil){
                    self.userdefaults.set(verificationID, forKey: "VerificationID")
                    self.userdefaults.synchronize()
                    if let vc = self.storyboard!.instantiateViewController(withIdentifier: "OtpViewController") as? OtpViewController{
                        vc.phoneNumber = self.txtphone.text!
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
//        if let vc = self.storyboard!.instantiateViewController(withIdentifier: "OtpViewController") as? OtpViewController{
//            vc.phoneNumber = self.txtphone.text!
//            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

//MARK:- SIGN IN METHODS
extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func showOtpController(){
        if let vc = storyboard!.instantiateViewController(withIdentifier: "OtpViewController") as? OtpViewController{
            vc.phoneNumber = self.txtphone.text!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func showSignup(){
        if let vc = storyboard!.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
