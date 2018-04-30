//
//  apiService.swift
//  apiDisplay
//
//  Created by HengVisal on 4/25/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import Foundation
import APIKit
import RxSwift

class apiService
{
    
    static let shared = apiService()
    private init() {}

    func apiPostRequest(completion: @escaping (apiResult) -> Void) {
        let request = apiInfo(grant_type: "password", client_id: "3", client_secret: "7d1rKIZCc80wQVEDk95uesFwUQnOGFpz7HPQGSbm", username: "suguru.sasaki@quad.co.jp", password: "abc123")
        Session.rx_sendRequest(request: request)
            .subscribe
            {
                [weak self] event in
                switch event
                {
                    case .next(let test): completion(test)
                    case .error(let error): print(error)
                    default:break
                }
            }
    }
}
extension Session {
    func rx_sendRequest<T: Request>(request: T) -> Observable<T.Response> {
        return Observable.create { observer in
            let task = self.send(request) { result in
                switch result {
                case .success(let res):
                    observer.on(.next(res))
                    observer.on(.completed)
                case .failure(let err):
                    observer.onError(err)
                }
            }
            return Disposables.create { [weak task] in
                task?.cancel()
            }
        }
    }
    class func rx_sendRequest<T: Request>(request: T) -> Observable<T.Response> {
        return shared.rx_sendRequest(request: request)
    }
}
