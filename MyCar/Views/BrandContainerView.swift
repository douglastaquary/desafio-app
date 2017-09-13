//
//  BrandContainerView.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

class BrandContainerView: UIView {
    
    let brandCollection = BrandCollection()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension BrandContainerView {

    func setUpView() {
        
        let contentView = self
        
        contentView.backgroundColor = .clear

        brandCollection.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(brandCollection)
        
        brandCollection.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        brandCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        brandCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        brandCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
