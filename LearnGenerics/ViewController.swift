//
//  ViewController.swift
//  LearnGenerics
//
//  Created by Raghad's Mac on 7/26/20.
//  Copyright © 2020 Raghad'Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let api: userAPIProtocol = UserAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        api.getUsers { (result) in
            switch result {
            case .success(let response):
                print(response?.data )
                let users = response?.data
                for user in users ?? [] {
                    print("\(user.firstName) \(String(describing: user.lastName))")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    

}

