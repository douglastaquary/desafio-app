//
//  BrandCollection.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

final class BrandCollection: UICollectionView {
    
    var didSelectBrand: ((Brand) -> Void)?
    
    fileprivate var customDatasource: BrandCollectionDatasource?
    fileprivate var customDelegate: BrandsCollectionDelegate?
    
    convenience init() {
        self.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        customDelegate = BrandsCollectionDelegate(self)
        customDatasource = BrandCollectionDatasource(items: [], collectionView: self, delegate: customDelegate!)
        self.backgroundColor = .clear
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BrandCollection {
    func updateItems(_ items: [Brand]) {
        customDatasource?.updateItems(items)
        self.reloadData()
    }
}


extension BrandCollection: BrandsDelegate {
    
    func didSelectBrand(at index: IndexPath) {
        let itemsCount = numberOfItems(inSection: 0)
        guard itemsCount > index.row else {
            return
        }
        
        if let brand = customDatasource?.items[index.row] {
            didSelectBrand?(brand)
        }
    }
}
