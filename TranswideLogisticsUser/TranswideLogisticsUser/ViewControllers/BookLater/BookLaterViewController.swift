//
//  BookLaterViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 29/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookLaterViewController: UIViewController{
    
    

    @IBOutlet weak var lblSelectType: UILabel!
    @IBOutlet weak var lblWithincity: UILabel!
    @IBOutlet weak var lbloutofcity: UILabel!
    @IBOutlet weak var lblSelectVehicle: UILabel!
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var tfDriverNotes: UITextField!
    @IBOutlet weak var lblDriverNotes: UILabel!
    @IBOutlet weak var tfEnterWeight: UITextField!
    @IBOutlet weak var imgEnterWeight: UIImageView!
    @IBOutlet weak var lblEnterWeight: UILabel!
    @IBOutlet weak var tfMaterialPicker: UITextField!
    @IBOutlet weak var imgSelectMaterial: UIImageView!
    @IBOutlet weak var lblSelectMaterial: UILabel!
    @IBOutlet weak var tfSelectVehicle: UITextField!
    @IBOutlet weak var imgSelectVehicle: UIImageView!
    @IBOutlet weak var tfDatepicker: UITextField!
    @IBOutlet weak var imgDatepicker: UIImageView!
    @IBOutlet weak var lblSelectDate: UILabel!
    @IBOutlet weak var tfcheckoutofcity: UITextField!
    @IBOutlet weak var tfcheckwithincity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    

    @IBAction func actionSubmit(_ sender: Any) {
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