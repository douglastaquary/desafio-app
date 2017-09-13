//
//  CarService.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit
import RxSwift

public struct CarService: CarRepository {
    
    public enum Error: Swift.Error {
        case unableToSave
        case nothingError
    }
    
    let disposeBag = DisposeBag()
    
    fileprivate(set) var provider: Networking = Networking.newDefaultNetworking()
    
    //MARK: Fetch Brands
    
    public func fetchBrands(_ completion: @escaping ([Brand]) -> Void) {
        
        let endpoint = FipeAPI.brand
        
        _ = provider
            .request(endpoint)
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapTo(arrayOf: Brand.self)
            .subscribe(onNext: { newBrands in
                completion(newBrands)
                
            })
            .addDisposableTo(disposeBag)
        
    }
    

    //MARK: Fetch Model
    
    public func fetchModels(to brand: String, completion: @escaping ([Model]) -> Void) {
        
        let endpoint = FipeAPI.models(brand: brand)
        
        _ = provider
            .request(endpoint)
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapTo(arrayOf: Model.self)
            .subscribe(onNext: { newModels in
                completion(newModels)
                
            })
            .addDisposableTo(disposeBag)
    }
    
    
     //MARK: Fetch Car
    
    public func carDetail(codigo_fipe: String, year: String, completion: @escaping ([Car]) -> Void) {
        
        let endpoint = FipeAPI.car(codigo_fipe: codigo_fipe, year: year)
        
        _ = provider
            .request(endpoint)
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapTo(arrayOf: Car.self)
            .subscribe(onNext: { cars in
                completion(cars)
            })
            .addDisposableTo(disposeBag)
    }
}

