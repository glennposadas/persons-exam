//
//  DataService.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import Alamofire
import EFInternetIndicator
import Moya
import SwiftyJSON

let dataServiceProvider = MoyaProvider<DataService>(plugins: [CachePolicyPlugin()])

enum DataService {
    case getPersons()
}

// MARK: - TargetType Protocol Implementationm

extension DataService: TargetType {
    var baseURL: URL {
        return URL(string: "https://glennposadas.github.io/jsons")!
    }
    
    var path: String {
        switch self {
        case .getPersons: return "/persons.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPersons: return .get
        }
    }
    
    var sampleData: Data {
        return Data(base64Encoded: "")!
    }
    
    var task: Task {
        switch self {
        case .getPersons: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
}

// MARK: - CatchePolicyGettable

extension DataService: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        switch self {
        case .getPersons: return .useProtocolCachePolicy
        }
    }
}








