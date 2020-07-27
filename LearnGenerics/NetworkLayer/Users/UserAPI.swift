//
//  UserAPI.swift
//  LearnGenerics
//
//  Created by Raghad's Mac on 7/27/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import Foundation


protocol userAPIProtocol{
    // don't foregt to set ? after model
    func getUsers(completion:@escaping(Result<UserResponse?, NSError>) -> Void)
}

class UserAPI: BaseAPI<UsersNetworking>, userAPIProtocol {
    
    func getUsers(completion:@escaping(Result<UserResponse?, NSError>) -> Void) {
        self.fetchData(target: .getUsers, responseClass: UserResponse.self) { (result) in
            completion(result)
        }
    }
}
