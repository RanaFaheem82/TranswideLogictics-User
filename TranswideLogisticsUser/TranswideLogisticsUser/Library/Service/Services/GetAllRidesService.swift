//
//  API.swift
//  Zon Bau
//
//  Created by Gulfam Khan on 04/09/2019.
//  Copyright © 2019 AcclivousByte. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetAllRidesService : BaseService{
    
    //MARK:- Shared data
    private var dataRequest:DataRequest?
    
    //MARK:- Shared Instance
    private override init(){}
    static func shared() -> GetAllRidesService {
        return GetAllRidesService()
    }
    
    fileprivate var sessionManager:SessionManager {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        return manager
    }

   
    //MARK:- Get All Rides API.
    
    func getAllRides(params:Parameters?,completion: @escaping (_ error: String, _ success: Bool, _ allRides: AllRidesViewModel?)->Void){
        
        let completeURL = BASE_URL + Trips
            print("Params \(params!)")
            print("URL \(completeURL)")
            dataRequest = sessionManager.request(completeURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil)
            
            dataRequest?
                .validate(statusCode: 200...500)
                .responseJSON(completionHandler: { response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        let parsedResponse = ResponseHandler.handleResponse(json)
                        if parsedResponse.serviceResponseType == .Success {
                            print(json)
                              let data = parsedResponse.swiftyJsonData!
                            let allRides = AllRidesViewModel(data: data["data"])
    //                        self.saveUserInfo(userInfo)
                            completion(parsedResponse.message,true, allRides)
                        }else {
                            completion(parsedResponse.message,false,nil)
                        }
                        
                    case .failure(let error):
                        let errorMessage:String = error.localizedDescription
                        print(errorMessage)
                        completion(errorMessage, false , nil)
                    }
                })
            
        }
}
