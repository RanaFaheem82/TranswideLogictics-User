//
//  ConfirmRideViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import GoogleMaps
class ConfirmRideViewController: UIViewController {

    
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblConfirm: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionConfirm(_ sender: Any) {
        
        if let vc = storyboard!.instantiateViewController(withIdentifier: "showDriverViewController") as? showDriverViewController{
        
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
