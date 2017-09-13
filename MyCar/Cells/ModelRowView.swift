//
//  ModelRowView.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

final class ModelRowView: UIView {
    

    var modelo: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightHeavy)
        return lb
    }()
    
    var ano: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.numberOfLines = 0
        lb.textColor = .black
        lb.layer.opacity = 0.5
        lb.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightHeavy)
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

extension ModelRowView {

    func setUpView() {
    
        let padding: CGFloat = 8

        let contentView = self
        let bottomView = UIView()
        
        bottomView.backgroundColor = .lightGray
        bottomView.layer.opacity = 0.5
        
        contentView.backgroundColor = .white
        
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bottomView)
        
        modelo.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(modelo)
        
        ano.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ano)
        
        bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        
        modelo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding).isActive = true
        modelo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding).isActive = true
        modelo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding).isActive = true

        ano.topAnchor.constraint(equalTo: modelo.bottomAnchor, constant: padding).isActive = true
        ano.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding).isActive = true
    }
}
