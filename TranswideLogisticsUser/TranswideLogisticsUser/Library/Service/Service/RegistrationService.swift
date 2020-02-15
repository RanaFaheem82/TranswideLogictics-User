//
//  RegistrationService.swift
//  WrestlerBlower
//
//  Created by Rapidzz Macbook on 29/08/2019.
//  Copyright © 2019 Rapidzz. All rights reserved.
//

import Foundation

class RegistrationService: BaseService {
   
    func doRegisterUser(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
        
        let homeURL = BASE_URL + URL_REGISTER_USER
        let params = ["name":requestMessage.name,
                      "email":requestMessage.email,
                      "password":requestMessage.password,
                      "fcm_token":requestMessage.fcmToken] as [String : Any]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: .POST, contentType: .HTML, url: homeURL, params: params as Dictionary<String, AnyObject>)
        if(requestMessage.isUpdateProfile){
            
            BaseNetwork().performUploadImageNetworkTask(requestMessage: networkRequestMessage, complete: { (networkResponseMessage) in
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
                
            )
        }else{
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
                
            )
        }
        
    }
    
    func forgetPassword(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
        
        let homeURL = BASE_URL + URL_FORGET_PASSWORD
        let params = [
            "email":requestMessage.email,
        ]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: .POST, contentType: .HTML, url: homeURL, params: params as Dictionary<String, AnyObject>)
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage, complete: { (networkResponseMessage) in
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                    complete(serviceResponse)
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
