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

class PostRequestService : BaseService{
    
    //MARK:- Shared data
    private var dataRequest:DataRequest?
    
    //MARK:- Shared Instance
    private override init(){}
    static func shared() -> PostRequestService {
        return PostRequestService()
    }
    
    fileprivate var sessionManager:SessionManager {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        return manager
    }

   
    //MARK:- Post Request API.
    
    func postRequest(params:Parameters?,completion: @escaping (_ error: String, _ success: Bool)->Void){
        
        let completeURL = BASE_URL + Request
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
    //                        self.saveUserInfo(userInfo)
                            completion(parsedResponse.message,true)
                        }else {
                            completion(parsedResponse.message,false)
                        }
                        
                    case .failure(let error):
                        let errorMessage:String = error.localizedDescription
                        print(errorMessage)
                        completion(errorMessage, false)
                    }
                })
            
        }
    
    //MARK:- Nearby Request API.
       
    func nearby(params:Parameters?,completion: @escaping (_ error: String, _ success: Bool, _ drivers : NearbyDriversListViewModel?)->Void){
           
           let completeURL = BASE_URL + NearbyDriver
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
                            let nearbyDrivers = NearbyDriversListViewModel(list: data["driversdata"])
       //                        self.saveUserInfo(userInfo)
                               completion(parsedResponse.message,true, nearbyDrivers)
                           }else {
                               completion(parsedResponse.message,false, nil)
                           }
                           
                       case .failure(let error):
                           let errorMessage:String = error.localizedDescription
                           print(errorMessage)
                           completion(errorMessage, false, nil)
                       }
                   })
               
           }
}