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
    
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var lblOtp: UILabel!
    @IBOutlet weak var lblEnterOtpCode: UILabel!
    @IBOutlet weak var tfOtpCode: OTPtextField!
    var phoneNumber:String = ""
    var signUpcheck = 0
    var userdefaults = UserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        //   self.AuthenticatePhone()
        tfOtpCode.configure(with: 6)
        tfOtpCode.didEnterLastdigit = { [weak self] code in
            print(code)
        }
    }
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    //    //MARK:- actions
    //      @IBAction func actionBack(_ sender: Any) {
    //          self.navigationController?.popViewController(animated: true)
    //      }
    //
    //      @IBAction func actionResend(_ sender: Any) {
    //          PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNumber, uiDelegate: nil) { (verificationID, error) in
    //                                   if(error == nil){
    //                                      UserDefaultsManager.shared.clearVerificationID()
    //                                      UserDefaultsManager.shared.verificationID = verificationID
    //                                      self.showAlertView(message: PopupMessages.verification)
    //                                   }
    //                                   else{
    //                                      self.showAlertView(message: PopupMessages.SomethingWentWrong)
    //                                   }
    //                               }
    //      }
    @IBAction func actionSubmit(_ sender: Any) {
//        guard let otpCode = tfOtpCode.text else  { return }
//        guard let verficationId = userdefaults.string(forKey: "VerificationID") else { return }
//        let credetials = PhoneAuthProvider.provider().credential(withVerificationID: verficationId, verificationCode: otpCode)
//        Auth.auth().signIn(with: credetials) { (authResult, error) in
//            if error != nil {
//                self.showAlertView(message: "WrongPin", title: "")
//            }
//            else{
//                self.doLogin()
//            }
//        }
        self.login(params: ["phoneNumber" : self.phoneNumber])
    }
    
    
    
    //        Auth.auth().signInAndRetrieveData(with: credetials) { (success, error) in
    //            if(error == nil){
    //                print("USER LOGED IN")
    //                if(self.signUpcheck == 1){
    //
    //                    self.showLogin()
    //                }else{
    //                self.showHomeVC()
    //                }
    //            }else{
    //
    //                print("WRONG")
    //            }
    //
    //        }
    //       }
    //    func AuthenticatePhone(){
    //        PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNumber, uiDelegate: nil) { (verificationId, error) in
    //            if error == nil{
    //                guard let verifyId = verificationId  else { return }
    //                self.userdefaults.set(verifyId, forKey: "VerificationID")
    //                self.userdefaults.synchronize()
    //            }else{
    //                print("unable to get secret id from f as Anyirebase",error?.localizedDescription as Any)
    //            }
    //        }
    //    }
    func showHomeVC(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "KYDrawerController") as? KYDrawerController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func showLogin(){
        if let vc = storyboard!.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
////MARK:- Register new user Api
extension OtpViewController{
    func login(params : ParamsAny){
        LoginService.shared().getUserLogin(params: params) { (message, success, user) in
            if(success){
                
            }
            else{
                
            }
        }
    }
}
