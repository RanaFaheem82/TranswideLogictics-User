//
//  SideMenuViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 2/22/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var menuArray = ["Home","My Shipments","Logout"]
    var imageAArray = ["home-2","t","back"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuTableViewCell", for: indexPath) as! SideMenuTableViewCell
        cell.imgMenu.image = UIImage(named: self.imageAArray[indexPath.row])
        cell.lblMenu.text = self.menuArray[indexPath.row]
              return cell
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let drawer = self.navigationController?.parent as! KYDrawerController
                    drawer.setDrawerState(.closed, animated: true)
                    let mainVC = (drawer.mainViewController as! UINavigationController).topViewController as! MainContainerViewController
              if(indexPath.row == 0){
                  mainVC.showHomeController()
              }
              else if(indexPath.row == 1){
                  mainVC.showMyShipmentVCController()
              }
              else{
                mainVC.logoutUser()
        }
             
              
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     self.mainContainer?.setTitle(title: "My Shipments")
     self.mainContainer?.setMenuButton()
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
////MARK:-
//extension SideMenuViewController : UITableViewDataSource,UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell", for: indexPath) as! SideMenuTableViewCell
//        return cell
//    }
//    
//    
//    
//    
//}
