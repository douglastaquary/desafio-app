//
//  Log.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import Foundation

public struct Log {
    
    public static func info(
        _ items: Any...,
        functionName: String = #function,
        fileName: String = #file,
        lineNumber: Int = #line)
    {
        log(items,
            functionName: functionName,
            fileName: fileName,
            lineNumber: lineNumber)
    }
    
    public static func error(
        _ error: Error?,
        functionName: String = #function,
        fileName: String = #file,
        lineNumber: Int = #line)
    {
        guard let error = error else {
            return
        }
        
        debug(error,
              functionName: functionName,
              fileName: fileName,
              lineNumber: lineNumber)
    }
    
    public static func debug(
        _ items: Any...,
        functionName: String = #function,
        fileName: String = #file,
        lineNumber: Int = #line)
    {
        #if DEBUG
            log(items,
                functionName: functionName,
                fileName: fileName,
                lineNumber: lineNumber)
        #endif
    }
    
    private static func log(
        _ items: [Any],
        functionName: String,
        fileName: String,
        lineNumber: Int)
    {
        let url = NSURL(fileURLWithPath: fileName)
        let lastPathComponent = url.lastPathComponent ?? fileName
        #if DEBUG
            print("[\(lastPathComponent):\(lineNumber)] \(functionName):",
                separator: "",
                terminator: " ")
        #endif
        for item in items {
            print(item, separator: "", terminator: "")
        }
        print("")
    }
    
}
