//
//  BookingViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {
    @IBOutlet weak var viewBooklater: UIView!
    @IBOutlet weak var viewBookNow: UIView!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfvehicleType: UITextField!
    @IBOutlet weak var imgVehicle: UIImageView!
    @IBOutlet weak var lblSelectVehicle: UILabel!
    @IBOutlet weak var tfDriverNotes: UITextField!
    @IBOutlet weak var lblEnterDriver: UILabel!
    @IBOutlet weak var lblEnterWeight: UILabel!
       @IBOutlet weak var imgMaterial: UIImageView!
    @IBOutlet weak var checkboxWithInCity: UIButton!
    @IBOutlet weak var checkboxCitytoCity: UIButton!
    @IBOutlet weak var imgWeight: UIImageView!
    @IBOutlet weak var lblCitytoCity: UILabel!
    @IBOutlet weak var lblWithInCity: UILabel!
    @IBOutlet weak var tfMatrial: UITextField!
    @IBOutlet weak var lblselectDate: UILabel!
    @IBOutlet weak var viewDatePicker: UIDatePicker!
    @IBOutlet weak var lblSelectDate: UILabel!
    @IBOutlet weak var lblselectMaterial: UILabel!
    
    
    //BOOK NOW OUTLETS
    
    @IBOutlet weak var lblSelectType: UILabel!
    @IBOutlet weak var lblcheckBoxNowWithinCity: UILabel!
    
    @IBOutlet weak var lblNowSelectMaterial: UILabel!
    @IBOutlet weak var btnNowWithinCity: UIButton!
    @IBOutlet weak var btnNowCitytoCity: UIButton!
    @IBOutlet weak var lblcheckBoxNowCitytoCity: UILabel!
    
    @IBOutlet weak var lblNowEnterWeight: UILabel!
    @IBOutlet weak var imgNowSelectMaterial: UIImageView!
    
    @IBOutlet weak var lblNowEnterDriverNotes: UILabel!
    @IBOutlet weak var tfNowSelectWeight: UITextField!
    
    @IBOutlet weak var tfNowSelectvehicle: UITextField!
    @IBOutlet weak var imgNowSelectVehicle: UIImageView!
    @IBOutlet weak var lblNowSelectVehicle: UILabel!
    @IBOutlet weak var tfNowEnterDriverNotes: UITextField!
    @IBOutlet weak var imgNowselectWeight: UIImageView!
    @IBOutlet weak var tfNowSelectMaterial: UITextField!
    
    
    
    
    @IBAction func actionShowBookNow(_ sender: Any) {
        self.viewBookNow.isHidden = false
        self.viewBooklater.isHidden = true
    }
    @IBAction func actionshowBookLater(_ sender: Any) {
        self.viewBookNow.isHidden = true
        self.viewBooklater.isHidden = false
    }
    

    @IBAction func actionSubmitBookLater(_ sender: Any) {
    
        if let vc = storyboard!.instantiateViewController(withIdentifier: "ConfirmRideViewController") as? ConfirmRideViewController{
                         
                             self.navigationController?.pushViewController(vc, animated: true)
    }
    
    }
    
    @IBAction func actionSubmitBookNow(_ sender: Any) {

            if let vc = storyboard!.instantiateViewController(withIdentifier: "ConfirmRideViewController") as? ConfirmRideViewController{
                             
                                 self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewBooklater.isHidden = true
        self.viewBookNow.isHidden = false

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
