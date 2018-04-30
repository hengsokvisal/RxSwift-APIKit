//
//  API.swift
//  apiDisplay
//
//  Created by HengVisal on 4/25/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import Foundation
import APIKit

struct apiResult{
    var token_type : String
    var expires_in : Int
    var access_token : String
    var refresh_token : String
    var user_id : Int
    init(object: Any) throws {
        guard let dictionary = object as? [String: Any],
            let token_type = dictionary["token_type"] as? String,
            let expires_in = dictionary["expires_in"] as? Int,
            let access_token = dictionary["access_token"] as? String,
            let refresh_token = dictionary["refresh_token"] as? String ,
            let user_id = dictionary["user_id"] as? Int else {
                throw ResponseError.unexpectedObject(object)
        }
        self.token_type = token_type
        self.expires_in = expires_in
        self.access_token = access_token
        self.refresh_token = refresh_token
        self.user_id = user_id
        
    }
}

