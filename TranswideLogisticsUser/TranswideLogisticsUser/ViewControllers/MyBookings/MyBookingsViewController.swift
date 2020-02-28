//
//  MyBookingsViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 26/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Firebase


class MyBookingsViewController: UIViewController {
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let db = Firestore.firestore()
    }
}
//
//    let newDocument =  db.collection("test").document()
//        newDocument.setData(["id" : newDocument.documentID,"date":"26-feb-2020","testing":true])
//
//        db.collection("test").document("TESTING_ID1").setData(["id" : //newDocument.documentID,"date":"26-feb-2020","testing":true])
//
//
//      //  using complation heandler
//        db.collection("test").addDocument(data: ["id":1]) { (error) in
//            if let error = error{
//                //there is error
//
//            }else{
//
//
//            }
//        }
//
//
//   db.collection("test").document("TESTING_ID1").delete()
//    //    getting data
//        db.collection("test").document().getDocument { (document, error) in
//            if error == nil{
//
//                if document != nil && document!.exists{
//
//                    let data = document?.data()
//                    print(data)
//                }
//
//            } else{
//
//                print(error)
//            }
//        }
//        db.collection("test").getDocuments { (snapshot, error) in
//            if error == nil && snapshot != nil {
//                for document in snapshot!.documents{
//
//                    let documentdata = document.data()
//                    print(documentdata)
//
//                }
//
//            }
//        }
        // Do any additional setup after loading the view.
    
    
    
    
    

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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell  = Bundle.main.loadNibNamed(CellIdentifiers.MyBookingTableViewCell, owner: self, options: nil)?.first as! MyBookingTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    
    
    
}
