//
//  LocationViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Alamofire

class LocationViewController: BaseViewController,GMSMapViewDelegate,CLLocationManagerDelegate{

    @IBOutlet weak var btnCurrentLocation: UIButton!
    @IBOutlet weak var pickupline: UILabel!
    @IBOutlet weak var viewMap: GMSMapView!
    @IBOutlet weak var destinationView: UIView!
    @IBOutlet weak var pickupView: UIView!
    @IBOutlet weak var tfDestination: UITextField!
    @IBOutlet weak var tfPickupPoint: UITextField!
    var placesClient: GMSPlacesClient!
    var LocationManager = CLLocationManager()
    var isPickup : Bool =  false
       var currentLocation: CLLocation?
       //  var mapView: GMSMapView!
       var marker = GMSMarker()
       var zoomLevel: Float = 15.0
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        self.tfPickupPoint.delegate = self
        self.tfDestination.delegate = self
         //placesClient = GMSPlacesClient.shared()
        LocationManager = CLLocationManager()
              LocationManager.desiredAccuracy = kCLLocationAccuracyBest
              LocationManager.requestAlwaysAuthorization()
              LocationManager.distanceFilter = 50
              LocationManager.startUpdatingLocation()
              LocationManager.delegate = self
              self.viewMap.delegate = self
              placesClient = GMSPlacesClient.shared()
       
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        self.mainContainer?.setTitle(title: "Home")
        self.mainContainer?.setMenuButton()
       }
    
    @IBAction func actionBooklater(_ sender: Any) {
        if let vc = storyboard!.instantiateViewController(withIdentifier: "BookLaterViewController") as? BookLaterViewController{
                   
                       self.navigationController?.pushViewController(vc, animated: true)
                           
    }
    }
    
 
    @IBAction func actionBookNow(_ sender: Any) {
        if let vc = storyboard!.instantiateViewController(withIdentifier: "BookNowViewController") as? BookNowViewController{
            vc.picklocation = self.tfPickupPoint.text
            vc.destinationLocation = self.tfDestination.text
                       self.navigationController?.pushViewController(vc, animated: true)
                           
        }
    }
    
    
    
    @IBAction func actionClearDestination(_ sender: Any) {
        
        self.tfDestination.text?.removeAll()
        
       
        
    }
    
    
    @IBAction func actionClearPickUp(_ sender: Any) {
         self.tfDestination.text?.removeAll()

        
    }
    
    
    @IBAction func actionSubmit(_ sender: Any) {
        if let vc = storyboard!.instantiateViewController(withIdentifier: "BookLaterViewController") as? BookLaterViewController{
                  
                      self.navigationController?.pushViewController(vc, animated: true)
                          
                    }
    }
    
    
    
    @IBAction func actionGetCurrentLocation(_ sender: Any) {
      
     
    }
    

    

}
//MARK:- SearchPlacesViewControllerDelegate.
extension  LocationViewController :UITextFieldDelegate ,SearchPlacesViewControllerDelegate{
    func getAddress(Address: NSAttributedString, LocationID: String) {
        if(isPickup){
        self.tfPickupPoint.attributedText = Address
        }
        else{
           self.tfDestination.attributedText = Address
        }
       
        
        self.placesClient.lookUpPlaceID(LocationID){(place,error) in
            if let place = place {
                if(self.isPickup){
                            self.tfPickupPoint.text = place.formattedAddress
                    self.showMarker(position :place.coordinate)
                    let camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude: place.coordinate.longitude, zoom: 15.0)
                                self.viewMap.camera = camera
                    Global.shared.pickupLocation = place.coordinate
                }
                else{
                    self.tfDestination.text = place.formattedAddress
                     Global.shared.destinationLocation = place.coordinate
                }
                
        
                        } else {
                           // self.showAlertView(message: LocalStrings.NoDataFound)
                        }
        }

    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
     if textField == self.tfPickupPoint {
            self.isPickup = true
            self.moveToSearchPlaceController()
            return false
        }
        else if textField == self.tfDestination {
            self.isPickup = false
                   self.moveToSearchPlaceController()
                   return false
               }
        return false
    }
    func moveToSearchPlaceController(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier:"SearchPlacesViewController") as! SearchPlacesViewController
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
//MARK: LOCATION MENEGAR METHODS.
extension LocationViewController{
    
    func getAddressFromLatLong(latitude: Double, longitude : Double) {
        let url = self.getUrl(lat: latitude, lng: longitude)
        print(url)
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success:
                
                let responseJson = response.value as! NSDictionary
                
                if let results = responseJson.object(forKey: "results")! as? [NSDictionary] {
                    if results.count > 0 {
                        let address = results[0]["formatted_address"] as? String
                        self.tfPickupPoint.text = address!
                        self.showMarker(position: self.viewMap.camera.target)
                    }
                }
            case .failure(_):
                self.showAlertVIew(message: "Location Not Found", title: "Message")
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location: CLLocation = manager.location!
        self.getAddressFromLatLong(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let userLocation:CLLocation = locations[0] as CLLocation
        let camera = GMSCameraPosition.camera(withLatitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude, zoom: 15.0)
        Global.shared.pickupLocation = userLocation.coordinate
        viewMap.camera = camera
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        self.showAlertVIew(message: error as! String, title: "MESSAGE")
    }
    
    func showMarker(position : CLLocationCoordinate2D ){
        marker.position = position
        marker.map = viewMap
        marker.isDraggable = true
    }
}


