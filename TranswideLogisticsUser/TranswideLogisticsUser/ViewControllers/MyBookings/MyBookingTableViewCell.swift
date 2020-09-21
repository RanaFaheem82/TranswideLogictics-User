//
//  MyBookingTableViewCell.swift
//  TranswideLogisticsUser
//
//  Created by apple on 19/02/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class MyBookingTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var valueStatus: UILabel!
    @IBOutlet weak var lblBookingid: UILabel!
    @IBOutlet weak var destinationLocation: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    @IBOutlet weak var imgTripVehicle: UIImageView!
    @IBOutlet weak var valueDate: UILabel!
    @IBOutlet weak var valuePrice: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var valuetripType: UILabel!
    @IBOutlet weak var valueWeight: UILabel!
    @IBOutlet weak var sourceLocation: UILabel!
    @IBOutlet weak var valueBookingid: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureView(ride : MyRidesViewModel){
        self.sourceLocation.text = ride.sourceAddress
        self.destinationLocation.text = ride.destinationAddress
      //  self.valueDate = ride
        self.valuePrice.text = ride.fare
        self.valueWeight.text = ride.weight + "KG"
        self.valueStatus.text = ride.status
        self.valueDate.text = ride.date
        self.lblBookingid.text = ride.tripId
    }
    
}
