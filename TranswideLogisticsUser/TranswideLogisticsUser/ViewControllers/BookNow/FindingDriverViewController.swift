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

    @IBOutlet weak var mapView: GMSMapView!
    
      var database : DatabaseReference!
    var pickLocation : String!
    var destinationLocation : String!
    var goodsDetails :  String = ""
    var notes : String = ""
    var weight : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
       // self.test()
        self.nearbyDrivers(params: ["latitude" :  Global.shared.pickupLocation!.latitude,"longitude" : Global.shared.pickupLocation!.longitude])
        // Do any additional setup after loading the view.
    }
    
    func test(){
        let marker = GMSMarker()
                   let markerImage = UIImage(named: "large")!.withRenderingMode(.alwaysTemplate)
                   let markerView = UIImageView(image: markerImage)
                    markerView.tintColor = UIColor.black
                   markerView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
                   marker.iconView = markerView
        self.database = Database.database().reference()
        let locationRef = self.database.child("rides").child("5ef3234e12d89b076a4174e4")
        let refHandle = locationRef.observe(DataEventType.value, with: { (snapshot) in
             self.stopActivity()
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            print(postDict)
            let status = postDict["status"]?.stringValue
            if(status == "accepted"){
                let location = CLLocationCoordinate2D(latitude: (postDict["lat"]?.doubleValue)!, longitude: (postDict["lng"]?.doubleValue)!)
                       print("location: \(location)")
                       marker.position = location
                      
                      // marker.snippet = data.name!
                marker.map = self.mapView
                  let camera = GMSCameraPosition.camera(withLatitude: (postDict["lat"]?.doubleValue)!, longitude: (postDict["lng"]?.doubleValue)!, zoom: 15.0)
                self.mapView.camera = camera
                //let cameraUpdate = GMSCameraUpdate.fit(GMSCoordinateBounds(coordinate: (postDict["lat"]?.doubleValue)!, coordinate: Global.shared.destinationLocation!))
               // self.mapView.moveCamera(cameraUpdate)
               // let currentZoom = self.mapView.camera.zoom
                //self.mapView.animate(toZoom: currentZoom - 1.4)
            }
          })
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
                let params : ParamsAny = ["userId" : "5ec361363258de198dfbce0a" , "token" : tokenList]
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
                self.database.child("rides").child(ride!.id).setValue(["pickup" : self.pickLocation,"destination" : self.destinationLocation , "status" : "pending" , "notes" : self.notes , "GoodsDetails" : self.goodsDetails , "weight" : self.weight])
                let locationRef = self.database.child("rides").child(ride!.id)
                    let refHandle = locationRef.observe(DataEventType.value, with: { (snapshot) in
                         self.stopActivity()
                        let postDict = snapshot.value as? [String : AnyObject] ?? [:]
                        print(postDict)
                        let status = postDict["status"]?.stringValue
                        if(status == "accepted"){
                            let location = CLLocationCoordinate2D(latitude: (postDict["lat"]?.doubleValue)!, longitude: (postDict["lng"]?.doubleValue)!)
                                   print("location: \(location)")
                                   marker.position = location
                                  
                                  // marker.snippet = data.name!
                            marker.map = self.mapView
                              let camera = GMSCameraPosition.camera(withLatitude: (postDict["lat"]?.doubleValue)!, longitude: (postDict["lng"]?.doubleValue)!, zoom: 15.0)
                            self.mapView.camera = camera
                            //let cameraUpdate = GMSCameraUpdate.fit(GMSCoordinateBounds(coordinate: (postDict["lat"]?.doubleValue)!, coordinate: Global.shared.destinationLocation!))
                           // self.mapView.moveCamera(cameraUpdate)
                           // let currentZoom = self.mapView.camera.zoom
                            //self.mapView.animate(toZoom: currentZoom - 1.4)
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
