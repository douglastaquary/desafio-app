//
//  Observable+Logging.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import RxSwift

extension Observable {
    func logError(prefix: String = "Error: ") -> Observable<Element> {
        return self.do(onError: { error in
            print("\(prefix)\(error)")
        })
    }
    
    func logServerError(message: String) -> Observable<Element> {
        return self.do(onError: { e in
            let error = e as NSError
            Log.debug(message)
            Log.debug("Error: \(error.localizedDescription). \n \(error.localizedDescription)")
        })
    }
    
    func logNext() -> Observable<Element> {
        return self.do(onNext: { element in
            print("\(element)")
        })
    }
}
