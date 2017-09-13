//
//  Car.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//


import Foundation
import SwiftyJSON

final public class Car: NSObject, JSONAbleType {
    
    var codigo_fipe: String
    var marca: String
    var modelo: String
    var ano: String
    var valor: Double
    
    init(codigo_fipe: String, marca: String, modelo: String, ano: String , valor: Double) {
        self.codigo_fipe = codigo_fipe
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
        self.valor = valor
    }
    
    static func fromJSON(_ json: [String : Any]) -> Car {
        let json = JSON(json)
        
        let codigo_fipe = json["codigo_fipe"].stringValue
        let marca = json["marca"].stringValue
        let modelo = json["modelo"].stringValue
        let ano = json["ano"].stringValue
        let valor = json["valor"].doubleValue
        
        return Car(codigo_fipe: codigo_fipe, marca: marca, modelo: modelo, ano: ano, valor: valor)
    }
}


