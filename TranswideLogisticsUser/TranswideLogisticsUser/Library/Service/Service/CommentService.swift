//
//  CommentService.swift
//  Hitch
//
//  Created by Rapidzz Macbook on 26/11/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation

class CommentService: BaseService {
    func addComment(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
           
           let homeURL = BASE_URL + URL_ADD_COMMENT
           
           let params = ["product_id":requestMessage.id,
                         "comment":requestMessage.comment,
                         "user_id": requestMessage.userId,
                         "rating":requestMessage.rating]
           
           let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.POST, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
           
           BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
               (networkResponseMessage) in
               
               switch networkResponseMessage.statusCode {
                   
               case .Success:
                   
                   let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
                  
                   switch parsedResponse.serviceResponseType{
                   case .Success:
                       if let data = parsedResponse.swiftyJsonData  {
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                           serviceResponse.data = data as AnyObject
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
           
       }
    func getComment(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
        
        let homeURL = BASE_URL + URL_GET_COMMENT
        
        let params = ["product_id":requestMessage.id,
                      "user_id": requestMessage.userId
                    ]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.POST, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
               
                switch parsedResponse.serviceResponseType{
                case .Success:
                    if let data = parsedResponse.swiftyJsonData  {
                     let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let list = CommentListViewModel(data: data)
                        serviceResponse.data = list
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
        
    }
}
