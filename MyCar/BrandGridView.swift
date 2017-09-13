//
//  BrandGridView.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

final class BrandGridView: UIView {

    
    var brand: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightHeavy)
        return lb
    }()
    
    
    var containerView: UIView = {
        let lb = UIView(frame: .zero)
        lb.alpha = CGFloat(0.8)
        return lb
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension BrandGridView {

    func setUpView() {
    
        let contentView = self
        
        contentView.backgroundColor = .white
        
        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 2.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        brand.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(brand)
        
        brand.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        brand.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

    }
}
