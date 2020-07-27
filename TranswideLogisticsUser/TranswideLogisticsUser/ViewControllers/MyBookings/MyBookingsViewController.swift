//
//  MyBookingsViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 26/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Firebase


class MyBookingsViewController: BaseViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var Allrides = AllRidesViewModel()
    @IBOutlet weak var btnCurrent: UIButton!
    @IBOutlet weak var btnScheduled: UIButton!
    @IBOutlet weak var btnHistory: UIButton!
    var isHistory : Bool = false
    var isSchedule : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnCurrent.backgroundColor = UIColor.orange
        var params = [String:AnyObject]()
        params = ["userId" : "5ec361363258de198dfbce0a"] as [String : AnyObject]
        self.getAllRides(params: params)
    }
    
    @IBAction func actionCurrent(_ sender: Any) {
        self.btnCurrent.backgroundColor = UIColor.orange
        self.btnHistory.backgroundColor = UIColor.white
        self.btnScheduled.backgroundColor = UIColor.white
        self.isHistory = false
        self.isSchedule = false
        self.tableView.reloadData()
    }
    @IBAction func actionHistory(_ sender: Any) {
        self.btnCurrent.backgroundColor = UIColor.white
        self.btnHistory.backgroundColor = UIColor.orange
        self.btnScheduled.backgroundColor = UIColor.white
        self.isHistory = true
        self.isSchedule = false
        self.tableView.reloadData()
    }
    @IBAction func actionScheduled(_ sender: Any) {
        self.btnCurrent.backgroundColor = UIColor.white
        self.btnHistory.backgroundColor = UIColor.white
        self.btnScheduled.backgroundColor = UIColor.orange
        self.isHistory = false
        self.isSchedule = true
        self.tableView.reloadData()
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


extension MyBookingsViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isHistory){
            return (self.Allrides.HistoryRides?.ridesList.count)!
        }
        else if(isSchedule){
            return (self.Allrides.bookedRides?.ridesList.count)!
        }
        else{
            return (self.Allrides.currentRides?.ridesList.count)!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = Bundle.main.loadNibNamed(CellIdentifiers.MyBookingTableViewCell, owner: self, options: nil)?.first as! MyBookingTableViewCell
        if(isHistory){
            cell.configureView(ride: (self.Allrides.HistoryRides?.ridesList[indexPath.row])!)
        }
        else if(isSchedule){
            cell.configureView(ride: (self.Allrides.bookedRides?.ridesList[indexPath.row])!)
        }
        else{
            cell.configureView(ride: (self.Allrides.currentRides?.ridesList[indexPath.row])!)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}
//MARK:- GET ALL RIDES API

extension MyBookingsViewController{
    func getAllRides(params : ParamsAny){
        GetAllRidesService.shared().getAllRides(params: params) { (message, success, allRides) in
            if(success){
                self.Allrides = allRides!
                self.tableView.reloadData()
            }
            else{
                self.showAlertVIew(message: message, title: "Transwide User")
            }
        }
    }
}
