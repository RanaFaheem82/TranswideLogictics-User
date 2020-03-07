//
//  BookingViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController ,TopBarDelegate{
    
    
    
    @IBAction func actionShowBookNow(_ sender: Any) {
        
    }
    @IBAction func actionshowBookLater(_ sender: Any) {
     
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
         
           // Do any additional setup after loading the view.
       }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)
           if let container = self.mainContainer{
               container.setTitle(title: "Booking")
               container.setMenuButton(isBack: true)
               container.delegate = self
           }
       }
    func actionCallBackMoveBack() {
           self.navigationController?.popViewController(animated: true)
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


