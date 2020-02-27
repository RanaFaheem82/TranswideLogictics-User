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

    
    @IBAction func actionShowSignup(_ sender: Any) {
        self.showSignup()
        
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        
        
        self.showOtpController()
      
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtphone.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
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
        //LocationViewController
     
    }
    
  
     
}
