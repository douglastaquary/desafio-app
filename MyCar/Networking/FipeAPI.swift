//
//  FipeAPI.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Alamofire

enum FipeAPI {
    
    case brand
    case models(brand: String)
    case car(codigo_fipe: String, year: String)
}

extension FipeAPI: TargetType {
    
//    
//    var baseURL: URL {
//        return URL(string: " http://fipe-api.herokuapp.com")!
//    }
    
    var base: String { return "http://fipe-api.herokuapp.com" }
    var baseURL: URL { return URL(string: base)! }
    
    var path: String {
        switch self {
        case .brand:
            return "/cars/brand"
            
        case .models(let brand):
            return "/cars/brand/\(brand)"
            
        case .car(let codigo_fipe, let year):
            return "/cars/\(codigo_fipe)/\(year)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        default:
            return [:]
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        default:
            return URLEncoding.default
        }
        
    }
    
    var task: Task {
        return .request
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
}


// MARK: Provider Support

private extension String {
    var URLEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }
}

func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}
