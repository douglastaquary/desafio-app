//
//  Networking.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import Moya
import RxSwift


class OnlineProvider<Target>: RxMoyaProvider<Target> where Target: TargetType {
    
    init(endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
         plugins: [PluginType] = []) {
        super.init(endpointClosure: endpointClosure, plugins: plugins)
    }
}


protocol NetworkingType {
    associatedtype T: TargetType
    var provider: OnlineProvider<FipeAPI> { get }
}


struct Networking: NetworkingType {
    typealias T = FipeAPI
    let provider: OnlineProvider<FipeAPI>
}


extension Networking {
    func request(_ token: FipeAPI) -> Observable<Moya.Response> {
        return self.provider.request(token)
    }
}


extension NetworkingType {
    static func newDefaultNetworking() -> Networking {
        return Networking(provider: newProvider([NetworkLoggerPlugin(verbose: true)]))
    }
}


private func newProvider<T>(_ plugins: [PluginType]) -> OnlineProvider<T> where T: TargetType {
    return OnlineProvider(plugins: plugins)
}


