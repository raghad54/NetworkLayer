//
//  BaseAPI.swift
//  LearnGenerics
//
//  Created by Raghad's Mac on 7/27/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation
import Alamofire

//class inhert form target protocol to make Generic request
class BaseAPI<T: TargetType> {
    
    func fetchData<M: Decodable>(target:T, responseClass: M.Type, completion:@escaping(Result<M?, NSError>) -> Void){
    
        let method  = Alamofire.HTTPMethod(rawValue: target.HTTPMethod.rawValue)
        let header = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParams(task: target.task)
        AF.request(target.baseUrl + target.path,method: method, parameters:params.0, encoding: params.1, headers: header).responseJSON {(response) in
            guard let statusCode = response.response?.statusCode else{
                completion(.failure(NSError()))
                return
            }
            if statusCode == 200 {
            
                guard let jsonResponse = try? response.result.get() else {
                     completion(.failure(NSError()))
                    return
                }
                guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse, options:[]) else  {
                     completion(.failure(NSError()))
                    return
                }
                
                guard let responseObjc = try? JSONDecoder().decode(M.self, from:theJSONData) else {
                     completion(.failure(NSError()))
                    return
                }
                
                completion(.success(responseObjc))
                
            } else {
                completion(.failure(NSError()))
            }
            
        }
        
    }
    //Handel params
    private func buildParams(task: Task) -> ([String:Any], ParameterEncoding){
        switch task {
        case .requestplain:
            return([:], URLEncoding.default)
        case .requestParameter(let parameters, let encoding):
            return(parameters,encoding)
        }
    }
}
