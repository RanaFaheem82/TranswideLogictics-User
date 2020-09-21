//
//  FindingDriverViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 5/17/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase

class FindingDriverViewController: BaseViewController ,GMSMapViewDelegate{

    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblVehicleName: UILabel!
    @IBOutlet weak var lblVehicleNumber: UILabel!
    @IBOutlet weak var lblDriverName: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var viewDriverDetails: UIView!
    @IBOutlet weak var imgDriver: UIImageView!
    @IBOutlet weak var lblVehicleColor: UILabel!
    
      var database : DatabaseReference!
    var pickLocation : String!
    var destinationLocation : String!
    var goodsDetails :  String = ""
    var notes : String = ""
    var weight : String = ""
    var isDriverShowing = false
    var driverId = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
       // self.test()
        self.viewDriverDetails.isHidden = true
        self.nearbyDrivers(params: ["latitude" :  Global.shared.pickupLocation!.latitude,"longitude" : Global.shared.pickupLocation!.longitude])
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainContainer?.setTitle(title: "Finding Nearby Driver")
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.mainContainer?.btnMenu.isHidden = false
    }
    
    
    @IBAction func actionCancel(_ sender: Any) {
    }
    
    @IBAction func actionChat(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        vc.otherUserId = self.driverId
        self.navigationController?.pushViewController(vc, animated: true)
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
        self.startActivityWithMessage(msg: "")
        GCD.async(.Background){
        PostRequestService.shared().nearby(params: params) { (message, success, list , tokenList) in
            GCD.async(.Main){
                               self.stopActivity()
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
                let params : ParamsAny = ["userId" : Global.shared.user!.id , "token" : tokenList!]
                self.sendNotifications(params: params)
            }
            else{
                self.showAlertVIew(message: message, title: "Traswide User")
            }
        }
     }}
    }
    
    func sendNotifications(params : ParamsAny){
           self.startActivityWithMessage(msg: "Finding you nearby Driver")
           GCD.async(.Background){
            PostRequestService.shared().sendNotification(params: params, completion: { (message, success, ride) in
               GCD.async(.Main){
               self.stopActivity()
               if(success){
                let marker = GMSMarker()
                let markerImage = UIImage(named: "large")!.withRenderingMode(.alwaysTemplate)
                let markerView = UIImageView(image: markerImage)
                 markerView.tintColor = UIColor.black
                markerView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
                marker.iconView = markerView
                self.startActivityWithMessage(msg: "Finding you nearby Driver")
                self.database = Database.database().reference()
                let locationRef = self.database.child("rides").child(Global.shared.user!.id)
                    let refHandle = locationRef.observe(DataEventType.value, with: { (snapshot) in
                        let postDict = snapshot.value as? [String : AnyObject] ?? [:]
                        print(postDict)
                        print(postDict["status"] as? String)
                        if(postDict["status"] as? String == "completed"){
                        self.mainContainer?.btnMenu.isHidden = false
                    self.database.child("rides").child(Global.shared.user!.id).removeAllObservers()
                        self.mainContainer?.btnMenu.isHidden = false
                        self.mainContainer?.showHomeController()
                            
                        }
                        else{
                        if(postDict["status"] as? String == "accepted"){
                            self.mainContainer?.setTitle(title: "Driver Details")
                            self.mainContainer?.btnMenu.isHidden = true
                            self.stopActivity()
                            if(!self.isDriverShowing){
                                self.lblDriverName.text = postDict["name"] as? String
                                self.lblVehicleName.text = postDict["vehicleName"] as? String
                                self.lblVehicleColor.text = postDict["vehicleColor"] as? String
                                self.lblVehicleNumber.text = postDict["vehicleNumber"] as? String
                                self.viewDriverDetails.isHidden = false
                                self.driverId = (postDict["driverId"] as? String)!
                                self.isDriverShowing = true
                            }
                            let location = CLLocationCoordinate2D(latitude: (postDict["lat"] as? Double)!, longitude: (postDict["lng"] as? Double)!)
                                   print("location: \(location)")
                                   marker.position = location
                                  
                                  // marker.snippet = data.name!
                            marker.map = self.mapView
                              let camera = GMSCameraPosition.camera(withLatitude: (postDict["lat"] as? Double)!, longitude: (postDict["lng"] as? Double)!, zoom: 15.0)
                            self.mapView.camera = camera
                            //let cameraUpdate = GMSCameraUpdate.fit(GMSCoordinateBounds(coordinate: (postDict["lat"]?.doubleValue)!, coordinate: Global.shared.destinationLocation!))
                           // self.mapView.moveCamera(cameraUpdate)
                           // let currentZoom = self.mapView.camera.zoom
                            //self.mapView.animate(toZoom: currentZoom - 1.4)
                        }
                        }
                      })
                      // Do any additional setup after{} loading the view.
               }
               else{
                   self.showAlertVIew(message: message, title: "Traswide User")
               }
           }
        })}
       }
}
