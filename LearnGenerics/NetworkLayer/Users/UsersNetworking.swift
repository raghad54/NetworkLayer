//
//  UsersNetworking.swift
//  LearnGenerics
//
//  Created by Raghad's Mac on 7/27/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation
import Alamofire

enum UsersNetworking{
    case getUsers
    case createUser(name: String, job: String)
}


extension UsersNetworking: TargetType {
    var baseUrl: String {
        switch self {
        default:
           return "https://reqres.in/api"
        }
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .createUser:
            return "/users"
        }
    }
    
    var HTTPMethod: HTTPMethods {
        switch self {
        case .getUsers :
            return .get
        case .createUser:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .getUsers:
            return .requestplain
        case .createUser(let name, let job):
            return .requestParameter(parameters: ["name":name, "job":job], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
