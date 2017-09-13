//
//  BrandCollectionCell.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit
import Reusable

final class BrandCollectionCell: UICollectionViewCell{
    
    let gridView = BrandGridView()
    
    static func size(for parentWidth: CGFloat) -> CGSize {
        let numberOfCells = CGFloat(2)
        let width = parentWidth / numberOfCells
        return CGSize(width: width, height: width)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
         setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(item: Brand) {
        
        gridView.brand.text = item.name

    }
    
    func setUpView() {
        
        self.contentView.addSubview(gridView)
        
        gridView.translatesAutoresizingMaskIntoConstraints = false
        
        gridView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        gridView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        gridView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        gridView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
}

extension BrandCollectionCell: Reusable {}


