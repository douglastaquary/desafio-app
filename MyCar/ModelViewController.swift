//
//  ModelViewController.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

protocol ModelsDelegate {
    func didSelectModel(at index: IndexPath)
}


final class ModelViewController: UIViewController {
    
    let provider: Networking!
    
    var models: [Model] = []
    
    let carService = CarService()
    
    var brand: Brand
    
    let containerView = ModelsContainerView()
    
    let modalTransitionController = ModalTransition()

    
    init(provider: Networking, brand: Brand) {
        self.provider = provider
        self.brand = brand
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ModelViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Modelos"
        
        carService.fetchModels(to: brand.name) { models in
            self.setUpTableView(with: models)
        }
    }
    
    override func loadView() {
        self.view = containerView
    }
}

extension ModelViewController {

    func setUpTableView(with models: [Model]) {
        containerView.modelsTable.updateItems(models)
        containerView.modelsTable.didSelectModel = { [weak self] model in
            guard let me = self else { return }
            
            me.navigateToNextController(with: model)
        }
    }
    
    func navigateToNextController(with model: Model) {
        let nextController = CarDetailViewController(provider: provider, model: model)
        nextController.modalPresentationStyle = .custom
        nextController.transitioningDelegate = modalTransitionController
        self.navigationController?.present(nextController, animated: true, completion: nil)
    }
}


