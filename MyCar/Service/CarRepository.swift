//
//  CarRepository.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import Foundation

public protocol CarRepository {

    func fetchBrands(_ completion: @escaping (_ brands: [Brand]) -> Void)
    func fetchModels(to brand: String, completion: @escaping (_ models: [Model]) -> Void)
    func carDetail(codigo_fipe: String, year: String, completion: @escaping (_ car: [Car]) -> Void)
}
