//
//  BrandItemsCollectionViewDatasource.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

protocol BrandItemsCollectionViewDatasource: UICollectionViewDataSource {
    
    associatedtype T
    
    var items: [T] {get}
    
    weak var collectionView: UICollectionView? {get}
    weak var delegate: UICollectionViewDelegate? {get}
    
    init(items: [T], collectionView: UICollectionView, delegate: UICollectionViewDelegate)
    
    func setUpCollectionView()
}


extension BrandItemsCollectionViewDatasource {
    func setUpCollectionView() {
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self.delegate
        self.collectionView?.reloadData()
    }
}
