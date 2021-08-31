//
//  NetworkManager.swift
//  RecipeTask
//
//  Created by Dina Adel on 8/24/21.
//  Copyright © 2021 Dina Adel. All rights reserved.
//encoding: .JSON)
import Foundation
import Alamofire

class NetworkManager {
    static let sharedNetworkManager = NetworkManager()
    func fetch(requestSpecs: RequestSpecs, completionHandler: @escaping (Any?)-> Void){
        var request = requestSpecs.url
        if let parameters = requestSpecs.parameters{
            request = getFullRequest(parameters: parameters, url: request)
        }
        AF.request(request).validate().responseDecodable(of: SearchApiModel.self) { (response) in
            
            completionHandler(response.value)
        }
    }
    
    private func getFullRequest(parameters:[String:String?],url: String)-> String{
        var request = url
        for param in parameters{
            if let value = param.value{
                request.append("&\(param.key)=\(value)")
            }
        }
        return request
    }
    
    
}

struct RequestSpecs{
    var url: String
    var parameters: [String:String?]?
    
    init(url: String,parameters: [String:String?]? = nil) {
        self.url = url
        self.parameters = parameters
    }
}
