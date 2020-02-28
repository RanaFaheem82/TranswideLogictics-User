//
//  showDriverViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import GoogleMaps

class showDriverViewController: UIViewController {

    @IBOutlet weak var lblDriverName: UILabel!
    @IBOutlet weak var lblDriverRating: UILabel!
    @IBOutlet weak var lblTypeVehicle: UILabel!
    @IBOutlet weak var lblVehicleno: UILabel!
    @IBOutlet weak var imgDriverProfile: UIImageView!
    @IBOutlet weak var lblETA: UILabel!
    @IBOutlet weak var viewDriverDetails: UIView!
    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actionOnLoading()
        // Do any additional setup after loading the view.
    }
    
    
    func actionOnLoading(){
        mapView.addSubview(viewDriverDetails)
        
        
    }
    
    @IBAction func actionCancelRide(_ sender: Any) {
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
