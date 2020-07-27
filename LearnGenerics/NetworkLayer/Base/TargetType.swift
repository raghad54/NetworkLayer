//
//  Base.swift
//  LearnGenerics
//
//  Created by Raghad's Mac on 7/27/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation
import Alamofire

enum HTTPMethods:String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


// if request include parameters or not
enum Task {
    case requestplain
    case requestParameter(parameters: [String:Any], encoding:ParameterEncoding)
}


// this protocol includes all proprties of Api request {wrapper}
protocol TargetType {
    var baseUrl: String { get }
    
    var path: String { get }
    
    var HTTPMethod: HTTPMethods { get }
    
    var task: Task { get }
    
    var headers: [String:String]? { get }
}
