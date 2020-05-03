//
//  ConfirmRideViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import GoogleMaps

class ConfirmRideViewController: BaseViewController, TopBarDelegate,GMSMapViewDelegate {
    func actionCallBackMoveBack() {
        self.navigationController?.popViewController(animated: true)
    }
    

    
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblConfirm: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    var pickupAddress : String!
      var marker = GMSMarker()
       var desmarker = GMSMarker()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        self.getRouteSteps(from: Global.shared.pickupLocation!, to: Global.shared.destinationLocation!)

       self.showMarker(position: Global.shared.pickupLocation!)
        self.showDesMarker(position: Global.shared.destinationLocation!)
        
        self.lblAddress.text = self.pickupAddress
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           if let container = self.mainContainer {
               container.delegate = self
               container.setTitle(title: "Confirm Rider")
               container.setMenuButton(isBack: true)
           }
       }
    
    @IBAction func actionConfirm(_ sender: Any) {
        
        if let vc = storyboard!.instantiateViewController(withIdentifier: "showDriverViewController") as? showDriverViewController{
        
            self.navigationController?.pushViewController(vc, animated: true)
                
            }
       
        
        
    }
    func showMarker(position : CLLocationCoordinate2D ){
              
                  marker.position = position
                  marker.map = mapView
                  marker.isDraggable = false
              }
    func showDesMarker(position : CLLocationCoordinate2D ){
                 
                     desmarker.position = position
                     desmarker.map = mapView
                     desmarker.isDraggable = false
                 }
    func getRouteSteps(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {

           let session = URLSession.shared

           let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=false&mode=driving&key=\("AIzaSyBTfypSbx_zNMhWSBXMTA2BJBMQO7_9_T8")")!

           let task = session.dataTask(with: url, completionHandler: {
               (data, response, error) in

               guard error == nil else {
                   print(error!.localizedDescription)
                   return
               }

               guard let jsonResult = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] else {

                   print("error in JSONSerialization")
                   return

               }



               guard let routes = jsonResult["routes"] as? [Any] else {
                   return
               }

               guard let route = routes[0] as? [String: Any] else {
                   return
               }

               guard let legs = route["legs"] as? [Any] else {
                   return
               }

               guard let leg = legs[0] as? [String: Any] else {
                   return
               }

               guard let steps = leg["steps"] as? [Any] else {
                   return
               }
                 for item in steps {

                   guard let step = item as? [String: Any] else {
                       return
                   }

                   guard let polyline = step["polyline"] as? [String: Any] else {
                       return
                   }

                   guard let polyLineString = polyline["points"] as? String else {
                       return
                   }

                   //Call this method to draw path on map
                   DispatchQueue.main.async {
                       self.drawPath(from: polyLineString)
                   }

               }
           })
           task.resume()
       }
           //MARK:- Draw Path line
       func drawPath(from polyStr: String){
           let path = GMSPath(fromEncodedPath: polyStr)
           let polyline = GMSPolyline(path: path)
           polyline.strokeWidth = 4.0
           polyline.map = mapView // Google MapView
          polyline.strokeColor = UIColor.orange


           let cameraUpdate = GMSCameraUpdate.fit(GMSCoordinateBounds(coordinate: Global.shared.pickupLocation!, coordinate: Global.shared.destinationLocation!))
           mapView.moveCamera(cameraUpdate)
           let currentZoom = mapView.camera.zoom
           mapView.animate(toZoom: currentZoom - 1.4)
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
