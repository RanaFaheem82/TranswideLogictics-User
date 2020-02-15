//
//  LoginService.swift
//  GirlsChase
//
//  Created by Rapidzz Macbook on 14/06/2019.
//  Copyright © 2019 Rapidzz. All rights reserved.
//

import Foundation

class LoginService: BaseService {
    
    func doLogin(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
        
        let homeURL = BASE_URL + URL_LOGIN
        let params = [
                      "email":requestMessage.email,
                      "password":requestMessage.password,
                      "fcm_token":requestMessage.fcmToken
                    ]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: .POST, contentType: .HTML, url: homeURL, params: params as Dictionary<String, AnyObject>)
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage, complete: { (networkResponseMessage) in
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let data = parsedResponse.swiftyJsonData  {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        
                        let userData = UserViewModel(user: data["data"])
                        serviceResponse.data = userData
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage(FAILED_MESSAGE as AnyObject)
                        complete(response)
                    }
                    
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage(FAILED_MESSAGE as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Request Timeout" as AnyObject)
                complete(response)
            }
        }
            
        )}
    
    func getUpdatedUserData(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
        
        let homeURL = BASE_URL //+ URL_UPDATED_USER
        let params = [
            "user_id":requestMessage.userId,
            
        ]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: .POST, contentType: .HTML, url: homeURL, params: params as Dictionary<String, AnyObject>)
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage, complete: { (networkResponseMessage) in
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let data = parsedResponse.swiftyJsonData  {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        
                        let userData = UserViewModel(user: data["data"])
                        serviceResponse.data = userData
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage(FAILED_MESSAGE as AnyObject)
                        complete(response)
                    }
                    
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage(FAILED_MESSAGE as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Request Timeout" as AnyObject)
                complete(response)
            }
        }
            
        )}
    
}
//MARK:- SOCIAL LOGIN
extension LoginService{
    func doSocialLogin(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){

    
    
    let homeURL = BASE_URL + URL_SOCIALLOGIN
    let params = [
                  "email":requestMessage.email,
                  "name":requestMessage.name,
                  "social_id":requestMessage.userId,
                  "fcm_token":requestMessage.fcmToken
                ]
    
    let networkRequestMessage = NetworkRequestMessage(requestType: .POST, contentType: .HTML, url: homeURL, params: params as Dictionary<String, AnyObject>)
    
    BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage, complete: { (networkResponseMessage) in
        switch networkResponseMessage.statusCode {
            
        case .Success:
            
            let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
            switch parsedResponse.serviceResponseType{
                
            case .Success:
                
                if let data = parsedResponse.swiftyJsonData  {
                    
                    let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                    
                    let userData = UserViewModel(user: data["data"])
                    serviceResponse.data = userData
                    complete(serviceResponse)
                }
                else{
                    let response = self.getErrorResponseMessage(FAILED_MESSAGE as AnyObject)
                    complete(response)
                }
                
                
            default:
                let response = self.getDefaultServiceResponse(parsedResponse)
                complete(response)
                
            }
        case .Failure:
            let response = self.getErrorResponseMessage(FAILED_MESSAGE as AnyObject)
            complete(response)
        case .Timeout:
            let response = self.getTimeoutErrorResponseMessage("Request Timeout" as AnyObject)
            complete(response)
        }
    }
        
    )}
    
    
}
