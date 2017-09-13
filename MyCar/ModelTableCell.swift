//
//  ModelTableCell.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import Reusable
import UIKit

final class ModelTableCell: UITableViewCell {
    
    var modelRow = ModelRowView()
    
    static func height() -> CGFloat {
        return 56
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(item: Model) {
        
        modelRow.modelo.text = item.modelo
        modelRow.ano.text = item.ano
    }
    
    func setUpView() {
        
        self.contentView.addSubview(modelRow)
        
        modelRow.translatesAutoresizingMaskIntoConstraints = false
        
        modelRow.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        modelRow.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        modelRow.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        modelRow.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
    
}

extension ModelTableCell: Reusable {}

