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

class LocationViewController: BaseViewController{

    
    @IBOutlet weak var lblpreviousDetails: UILabel!
    
    @IBOutlet weak var btnCurrentLocation: UIButton!
    @IBOutlet weak var lblpreviousInfo: UILabel!
    @IBOutlet weak var viewPreviouslocation: UIView!
    @IBOutlet weak var lblViewtext: UITextView!
    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var viewMap: GMSMapView!
    @IBOutlet weak var destinationView: UIView!
    @IBOutlet weak var pickupView: UIView!
    @IBOutlet weak var tfDestination: UITextField!
    @IBOutlet weak var tfPickupPoint: UITextField!
    var placesClient: GMSPlacesClient!
        let LocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        
    super.viewDidLoad()
        self.tfPickupPoint.delegate = self
    //   self.actionsOnLoading()
         placesClient = GMSPlacesClient.shared()
       
    }
    
    
    func actionsOnLoading(){
        
         //self.destinationView.dropShadow(color: .orange, opacity: 1.0, offSet: CGSize(width: 1, height: 1), radius: 1, scale: true)
         self.btnCurrentLocation.isHidden = false
         self.viewMap.addSubview(self.btnCurrentLocation)
         self.btnCurrentLocation.backgroundColor = .red
//         self.viewMap.addSubview(destinationView)
//         self.viewMap.addSubview(pickupView)
         self.viewMap.addSubview(viewTitle)
         self.mainContainer?.setMenuButton()
         self.mainContainer?.setTitle(title: "Home")
         viewTitle.animateToggleAlpha(duration: 4.0)
         //self.destinationView.showAnimateView(duration: 1.0)
       //  self.pickupView.showAnimateView(duration: 1.0)
        self.viewPreviouslocation.dropShadow(color: .orange, opacity: 1.0, offSet: CGSize(width: 10, height: 5), radius: 2, scale: true)
        
        
        
    }
    
    
    
    @IBAction func actionClearDestination(_ sender: Any) {
        
        self.tfDestination.text?.removeAll()
        
       
        
    }
    
    
    @IBAction func actionClearPickUp(_ sender: Any) {
         self.tfDestination.text?.removeAll()

        
    }
    
    
    @IBAction func actionSubmit(_ sender: Any) {
        if let vc = storyboard!.instantiateViewController(withIdentifier: "BookingViewController") as? BookingViewController{
                  
                      self.navigationController?.pushViewController(vc, animated: true)
                          
                      }
    }
    
    
    
    @IBAction func actionGetCurrentLocation(_ sender: Any) {
        self.getCurrentLocation()
        print("clicked")
    }
    

    

}
//MARK:- SearchPlacesViewControllerDelegate.
extension  LocationViewController :UITextFieldDelegate ,SearchPlacesViewControllerDelegate{
    func getAddress(Address: NSAttributedString, LocationID: String) {
        self.tfPickupPoint.attributedText = Address
       
        
        self.placesClient.lookUpPlaceID(LocationID){(place,error) in
            if let place = place {
                            self.tfPickupPoint.text = place.formattedAddress
                           // self.showMarker(position :place.coordinate)
            //                let camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude: place.coordinate.longitude, zoom: 15.0)
                            //self.MapView.camera = camera
                        } else {
                           // self.showAlertView(message: LocalStrings.NoDataFound)
                        }
        }

    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.tfPickupPoint {
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


