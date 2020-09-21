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

class LoginService : BaseService{
    
    //MARK:- Shared data
    private var dataRequest:DataRequest?
    
    //MARK:- Shared Instance
    private override init(){}
    static func shared() -> LoginService {
        return LoginService()
    }
    
    fileprivate var sessionManager:SessionManager {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        return manager
    }
    
   
    
  
    
    
    //MARK:- Verify Url API
    func verifyUrl(params:Parameters?,completion: @escaping (_ error: String, _ success: Bool)->Void){
        
     //   let completeURL = EndPoints.BASE_URL
//        print("Params \(params!)")
//        print("URL \(completeURL)")
//        dataRequest = sessionManager.request(completeURL, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil)
//
        dataRequest?
            .validate(statusCode: 200...500)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let parsedResponse = ResponseHandler.handleResponse(json)
                    
                    if parsedResponse.serviceResponseType == .Success {
                        let data = json[KEY_RESPONSE_DATA]
//                        Global.shared.url = data["url"].stringValue
//                        UserDefaultsManager.shared.configurationUrl = data["url"].stringValue
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
    //MARK:- Register User API.
    
    func getUserRegister(params:Parameters?,completion: @escaping (_ error: String, _ success: Bool, _ userInfo: UserViewModel?)->Void){
            
        let completeURL = BASE_URL + Register
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
                            let userInfo = UserViewModel(user: parsedResponse.swiftyJsonData!)
    //                        self.saveUserInfo(userInfo)
                            completion(parsedResponse.message,true, userInfo)
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
    
    //MARK:- Register User API.
//       func getUserRegister(params:ParamsString, profileImage:UIImage?, completion: @escaping (_ error: String, _ success: Bool, _ userInfo: UserViewModel?)->Void){
//           var userInfo : UserViewModel!
//           let completeURL = EndPoints.BASE_URL + EndPoints.Register
//        var imageDict = [String : Data]()
//        let headers = [String : String]()
//        if let image = profileImage{
//           imageDict = [DictKeys.image:image.jpegData(compressionQuality: 0.8)!]
//        }
//           self.makePostAPICallWithMultipart(with: completeURL, dict: imageDict, params: params , headers: headers) { (message, success, json) in
//               if success {
//                userInfo = UserViewModel(objUser: json!)
//               }
//               completion(message,success,userInfo)
//           }
//       }

    //MARK:- Login user API.
    func getUserLogin(params:Parameters?,completion: @escaping (_ error: String, _ success: Bool, _ UserInfo : UserViewModel?)->Void){
        
        let completeURL = BASE_URL + URL_LOGIN
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
                        let userInfo = UserViewModel(user:       parsedResponse.swiftyJsonData!["data"])
                      //  self.saveUserInfo(userInfo)
                        completion(parsedResponse.message,true, userInfo)
                    }else {
                        completion(parsedResponse.message,false, nil)
                    }
                    
                case .failure(let error):
                    let errorMessage:String = error.localizedDescription
                    print(errorMessage)
                    completion(errorMessage, false,nil)
                }
            })
        
    }
    func forgetPassword(params:Parameters?,completion: @escaping (_ error: String, _ success: Bool)->Void){
        
       // let completeURL = EndPoints.BASE_URL + EndPoints.forgot_password
//        print("Params \(params!)")
//        print("URL \(completeURL)")
//        dataRequest = sessionManager.request(completeURL, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil)
//
        dataRequest?
            .validate(statusCode: 200...500)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let parsedResponse = ResponseHandler.handleResponse(json)
                    
                    if parsedResponse.serviceResponseType == .Success {
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
}
