//
//  showDriverViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import GoogleMaps

class showDriverViewController: BaseViewController,TopBarDelegate ,GMSMapViewDelegate{
    func actionCallBackMoveBack() {
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBOutlet weak var viewDriver: UIView!
    @IBOutlet weak var lblDriverName: UILabel!
    @IBOutlet weak var lblDriverRating: UILabel!
    @IBOutlet weak var lblTypeVehicle: UILabel!
    @IBOutlet weak var lblVehicleno: UILabel!
    @IBOutlet weak var imgDriverProfile: UIImageView!
    @IBOutlet weak var lblETA: UILabel!
    @IBOutlet weak var viewDriverDetails: UIView!
    @IBOutlet weak var mapView: GMSMapView!
    let marker = GMSMarker()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.actionOnLoading()
        self.mapView.delegate = self
        self.showmarker(position: Global.shared.pickupLocation!)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           if let container = self.mainContainer {
               container.delegate = self
               container.setTitle(title: "Driver Details")
               container.setMenuButton(isBack: true)
           }
       }
    
    func actionOnLoading(){
        mapView.addSubview(viewDriverDetails)
        
        
    }
    
    @IBAction func actionCancelRide(_ sender: Any) {
    }
    
    func showmarker(position : CLLocationCoordinate2D){
        let camera = GMSCameraPosition.camera(withLatitude: position.latitude, longitude: position.longitude, zoom: 15.0)
          mapView.camera = camera
        
        let markerImage = UIImage(named: "large")!.withRenderingMode(.alwaysTemplate)
        let markerView = UIImageView(image: markerImage)
         markerView.tintColor = UIColor.black
        markerView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        marker.position = position
        marker.iconView = markerView
        marker.map = mapView
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
