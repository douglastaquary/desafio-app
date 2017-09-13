//
//  Observable+JSONAble.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import Foundation
import Moya
import RxSwift

enum CarError: String {
    case couldNotParseJSON
    case notLoggedIn
    case missingData
}

extension CarError: Swift.Error { }

extension Observable {
    
    typealias Dictionary = [String: AnyObject]
    
    /// Get given JSONified data, pass back objects
    func mapTo<B: JSONAbleType>(object classType: B.Type) -> Observable<B> {
        return self.map { json in
            guard let dict = json as? Dictionary else {
                throw CarError.couldNotParseJSON
            }
            
            return B.fromJSON(dict)
        }
    }
    
    /// Get given JSONified data, pass back objects as an array
    func mapTo<B: JSONAbleType>(arrayOf classType: B.Type) -> Observable<[B]> {
        return self.map { json in
            guard let array = json as? [AnyObject] else {
                throw CarError.couldNotParseJSON
            }
            
            guard let dicts = array as? [Dictionary] else {
                throw CarError.couldNotParseJSON
            }
            
            return dicts.map { B.fromJSON($0) }
        }
    }
    
}
