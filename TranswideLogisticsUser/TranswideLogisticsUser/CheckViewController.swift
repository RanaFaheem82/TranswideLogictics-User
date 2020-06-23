//
//  CheckViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 5/30/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import FirebaseDatabase
import GoogleMaps
import GooglePlaces
import Alamofire


class CheckViewController: BaseViewController {

  
    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var lng: UILabel!
     var database : DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
       database = Database.database().reference()
        let locationRef = database.child("Location")
        let refHandle = locationRef.observe(DataEventType.value, with: { (snapshot) in
          let postDict = snapshot.value as? [String : AnyObject] ?? [:]
          print(postDict)
        })
        // Do any additional setup after{} loading the view.
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
