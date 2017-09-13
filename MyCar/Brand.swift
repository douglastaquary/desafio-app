//
//  Brand.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import Foundation
import SwiftyJSON

final public class Brand: NSObject, JSONAbleType {
    
    var name: String

    init(name: String) {
        self.name = name
    }
    
    static func fromJSON(_ json: [String : Any]) -> Brand {
        let json = JSON(json)
        
        let name = json["marca"].stringValue
        
        return Brand(name: name)
    }
}

