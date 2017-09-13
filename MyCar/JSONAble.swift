//
//  JSONAble.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

protocol JSONAbleType {
    static func fromJSON(_: [String: Any]) -> Self
}

