//
//  BrandCollectionDatasource.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

final class BrandCollectionDatasource: NSObject, BrandItemsCollectionViewDatasource {
    
    var items: [Brand] = []
    
    weak var collectionView: UICollectionView?
    weak var delegate: UICollectionViewDelegate?
    
    required init(items: [Brand], collectionView: UICollectionView, delegate: UICollectionViewDelegate) {
        self.items = items
        self.collectionView = collectionView
        self.delegate = delegate
        
        super.init()
        
        collectionView.register(cellType: BrandCollectionCell.self)
        
        self.setUpCollectionView()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: BrandCollectionCell.self)
        let brand = self.items[indexPath.row]
        cell.setup(item: brand)
        return cell
    }
    
    func updateItems(_ items: [Brand]) {
        self.items = items
        self.collectionView?.reloadData()
    }
}


class BrandsCollectionDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let delegate: BrandsDelegate
    
    init(_ delegate: BrandsDelegate) {
        self.delegate = delegate
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelectBrand(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 10
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width - 30
        return BrandCollectionCell.size(for: width)
    }
}
