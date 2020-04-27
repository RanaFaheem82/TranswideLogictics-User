//
//  JobsViewController.swift
//  TranswideLogisticsUser
//
//  Created by apple on 4/27/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class JobsViewController: BaseViewController {

    @IBOutlet weak var btnIsCurrent: UIButton!
    @IBOutlet weak var btnHistory: UIButton!
    var isCurrent: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func actionCurrent(_ sender: Any) {
        
    }
    
    @IBAction func actionHistory(_ sender: Any) {
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
//MARK:- Table View Methods

extension JobsViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobsTableViewCell", for: indexPath) as! JobsTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 147
    }
    
}
