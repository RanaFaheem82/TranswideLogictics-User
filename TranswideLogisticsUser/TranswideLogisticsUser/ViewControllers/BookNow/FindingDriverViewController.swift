//
//  FindingDriverViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 5/17/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import GoogleMaps

class FindingDriverViewController: BaseViewController ,GMSMapViewDelegate{

    @IBOutlet weak var mapView: GMSMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        self.nearbyDrivers(params: ["latitude" :  Global.shared.pickupLocation!.latitude,"longitude" : Global.shared.pickupLocation!.longitude])
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
extension FindingDriverViewController{
    func nearbyDrivers(params : ParamsAny){
        PostRequestService.shared().nearby(params: params) { (message, success, list) in
            if(success){
                for data in list!.driverList{
                    let location = CLLocationCoordinate2D(latitude: Double(data.latitude)!, longitude: Double(data.longitude)!)
                           print("location: \(location)")
                           let marker = GMSMarker()
                           marker.position = location
                          let markerImage = UIImage(named: "large")!.withRenderingMode(.alwaysTemplate)
                         let markerView = UIImageView(image: markerImage)
                          markerView.tintColor = UIColor.black
                         markerView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
                         marker.iconView = markerView
                          // marker.snippet = data.name!
                    marker.map = self.mapView
                       }
                let location = CLLocationCoordinate2D(latitude: Global.shared.pickupLocation!.latitude, longitude: Global.shared.pickupLocation!.longitude)
                   print("location: \(location)")
                  let marker = GMSMarker()
                  marker.position = location
                                        // marker.snippet = data.name!
                marker.map = self.mapView
                let cameraUpdate = GMSCameraUpdate.fit(GMSCoordinateBounds(coordinate: Global.shared.pickupLocation!, coordinate: Global.shared.destinationLocation!))
                self.mapView.moveCamera(cameraUpdate)
                let currentZoom = self.mapView.camera.zoom
                self.mapView.animate(toZoom: currentZoom - 1.4)
            }
            else{
                self.showAlertVIew(message: message, title: "Traswide User")
            }
        }
    }
}
