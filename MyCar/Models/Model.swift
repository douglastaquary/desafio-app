//
//  Model.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import Foundation
import SwiftyJSON

final public class Model: NSObject, JSONAbleType {
    
    var codigo_fipe: String
    var modelo: String
    var ano: String
    
    init(codigo_fipe: String, modelo: String, ano: String ) {
        self.codigo_fipe = codigo_fipe
        self.modelo = modelo
        self.ano = ano
    }
    
    static func fromJSON(_ json: [String : Any]) -> Model {
        let json = JSON(json)
        
        let codigo_fipe = json["codigo_fipe"].stringValue
        let modelo = json["modelo"].stringValue
        let ano = json["ano"].stringValue
        
        return Model(codigo_fipe: codigo_fipe, modelo: modelo, ano: ano)
    }
}

