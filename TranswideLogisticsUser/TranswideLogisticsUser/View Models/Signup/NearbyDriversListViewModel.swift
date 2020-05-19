
import Foundation
import Alamofire
import SwiftyJSON

class NearbyDriversListViewModel {
    
    var driverList: [NearbyDriverViewModel]
    
    init() {
        self.driverList = [NearbyDriverViewModel]()
    }
    
    init(list: JSON) {
        self.driverList = [NearbyDriverViewModel]()
        let results = list.array
        
        for category in results!{
            self.driverList.append(NearbyDriverViewModel(data: category))
        }
    }
}
