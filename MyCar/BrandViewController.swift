//
//  BrandViewController.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

protocol BrandsDelegate {
    func didSelectBrand(at index: IndexPath)
}


final class BrandViewController: UIViewController {
    
    var brands: [Brand] = []
    
    var provider: Networking!

    let containerView = BrandContainerView()
    
    let carService = CarService()
    
    init(provider: Networking) {
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BrandViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Marcas"
        
        carService.fetchBrands { brands in
            self.setUpCollectionView(with: brands)
        }
    }
    
    
    override func loadView() {
        self.view = containerView
    }
}


extension BrandViewController {
    
    func setUpCollectionView(with brands: [Brand]) {
        containerView.brandCollection.updateItems(brands)
        containerView.brandCollection.didSelectBrand = { [weak self] brand in
            self?.navigateToNextController(with: brand)
        }
    }
    
    func navigateToNextController(with brand: Brand) {
        let nextController = ModelViewController(provider: self.provider, brand: brand)
        self.navigationController?.pushViewController(nextController, animated: true)
    }
}

