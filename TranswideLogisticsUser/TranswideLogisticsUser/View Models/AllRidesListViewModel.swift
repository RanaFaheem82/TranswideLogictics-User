
import Foundation
import Alamofire
import SwiftyJSON

class AllRidesListViewModel {
    
    var ridesList: [MyRidesViewModel]
    
    init() {
        self.ridesList = [MyRidesViewModel]()
    }
    
    init(list: JSON) {
        self.ridesList = [MyRidesViewModel]()
        let results = list.array
        
        for category in results!{
            self.ridesList.append(MyRidesViewModel(data: category))
        }
    }
}
