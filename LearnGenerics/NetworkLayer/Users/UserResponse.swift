//
//  UserResponse.swift
//  LearnGenerics
//
//  Created by Raghad's Mac on 7/27/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation

class UserResponse: Codable {
    var data : [UserModel]?
    // Capital CodingKeys  
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

