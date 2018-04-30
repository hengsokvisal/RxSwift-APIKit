//
//  apiParam.swift
//  apiDisplay
//
//  Created by HengVisal on 4/25/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//
import APIKit
import RxSwift
struct apiInfo : Request
{
    let grant_type : String
    let client_id : String
    let client_secret : String
    let username : String
    let password : String
    
    typealias Response = apiResult
    var baseURL: URL{
        return URL(string: "https://nsapp.neurospace.jp")!
    }
    var path : String{
        return "/oauth/token"
    }
    var parameters: Any?{
        let params = [
            "grant_type": self.grant_type,
            "client_id": self.client_id,
            "client_secret": self.client_secret,
            "username": self.username,
            "password": self.password
        ]
        return params
    }
    var headerFields: [String : String]{
        return [
            "Accept": "application/json",
            "Accept-Encoding": "gzip"
        ]
    }
    var method: HTTPMethod{
        return .post
    }
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> apiResult{
        print(object)
        return try apiResult(object: object)
    }
}

