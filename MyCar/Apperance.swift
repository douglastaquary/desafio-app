//
//  Apperance.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import Foundation
import UIKit

struct Apperance {
    
    static func customizeNavigationBar() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.black
        navigationBarAppearace.barTintColor = .white
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.systemFont(ofSize: 17, weight: UIFontWeightHeavy)]
    }
    
}
