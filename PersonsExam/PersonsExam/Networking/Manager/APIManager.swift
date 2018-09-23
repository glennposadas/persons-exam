//
//  APIManager.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import Moya
import Result
import SwiftyJSON

/// The manager for all API Calls.
class APIManager {
    /// Base class of ```APIManager```.
    class Base {
        typealias SuccessCallBack = ((_ jsonObj: JSON) -> Void)?
        typealias ErrorCallBack = ((_ errorMsg: String) -> Void)?
        
        static func validateResult(_ result: Result<Response, MoyaError>, onSuccess: SuccessCallBack = nil, onError: ErrorCallBack = nil) {
            switch result {
            case let .success(moyaResponse):
                let jsonObj = JSON(moyaResponse.data)
                if moyaResponse.statusCode == 200 {
                    onSuccess?(jsonObj)
                    return
                }
                
                if let error = jsonObj["error_description"].string {
                    onError?(error)
                    return
                }
                
                if let message = jsonObj["message"].string {
                    onError?(message)
                    return
                }
                
                onError?("An error has occured.")
                
            case let .failure(error):
                onError?("Error: \(error.localizedDescription)")
            }
        }
    }
    
    /// Auth calls
    class Persons: Base {
        typealias PersonsSuccessCallBack = ((_ persons: [Person]) -> Void)
        
        /// Get the Data
        static func getPersons(onSuccess: @escaping PersonsSuccessCallBack, onError: ErrorCallBack) {
            dataServiceProvider.request(.getPersons()) { (result) in
                self.validateResult(result, onSuccess: { (jsonObj) in
                    guard let jsonArray = jsonObj.array else {
                        onError?("An error has occurred")
                        return
                    }
                    onSuccess(jsonArray.map { Person(fromJson: $0) })
                }, onError: onError)
            }
        }
    }
}


