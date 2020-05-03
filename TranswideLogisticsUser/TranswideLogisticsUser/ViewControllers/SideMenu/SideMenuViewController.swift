//
//  SideMenuViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 2/22/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuTableViewCell", for: indexPath) as! SideMenuTableViewCell
              return cell
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
