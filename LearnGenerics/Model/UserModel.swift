//
//  UserModel.swift
//  LearnGenerics
//
//  Created by Raghad's Mac on 7/27/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation

class UserModel: Codable {
    var firstName: String?
    var lastName: String?
    
    enum CodingKeys: String,CodingKey{
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
