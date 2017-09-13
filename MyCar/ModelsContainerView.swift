//
//  ModelsContainerView.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

class ModelsContainerView: UIView {
    
    let modelsTable = ModelsTable()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ModelsContainerView {
    
    func setUpView() {
        
        let contentView = self
        
        contentView.backgroundColor = .clear
        
        modelsTable.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(modelsTable)
        
        modelsTable.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        modelsTable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        modelsTable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        modelsTable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

