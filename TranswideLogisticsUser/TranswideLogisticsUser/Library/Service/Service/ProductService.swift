//
//  ProductService.swift
//  Hitch
//
//  Created by Gulfam Khan on 28/11/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation

class ProductService: BaseService {
    func getProductDetails(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
        
        let homeURL = BASE_URL_LIVE
            + URL_GET_PRODUCT_BY_ID + "\(requestMessage.productId)"
        
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
               
                switch parsedResponse.serviceResponseType{
                case .Success:
                    if let data = parsedResponse.swiftyJsonData  {
                     let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let product = ProductViewModel(product: data["data"])
                        serviceResponse.data = product as AnyObject
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
    
    func getProductsByCategory(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
        
        let homeURL = BASE_URL_LIVE + URL_GET_PRODUCT_BY_CATEGORY + "\(requestMessage.categoryId)"
        
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
               
                switch parsedResponse.serviceResponseType{
                case .Success:
                    if let data = parsedResponse.swiftyJsonData  {
                     let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let productList = ProductListViewModel(products: data)
                        serviceResponse.data = productList as AnyObject
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
