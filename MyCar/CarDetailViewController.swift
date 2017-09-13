//
//  CarDetailViewController.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit


final class CarDetailViewController: UIViewController {
    
    let provider: Networking
    
    var car: Car!
    
    var model: Model
    
    let carService = CarService()
    
    let carDetailView = CarDetailView()
    
    public init(provider: Networking, model: Model) {
        self.provider = provider
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CarDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carDetailView.cancelButton.addTarget(self,
                                             action: #selector(CarDetailViewController.didEnd),
                                             for: .touchUpInside)
        
        carService.carDetail(codigo_fipe: model.codigo_fipe, year: model.ano) { cars in
            self.setUpView(with: cars[0])
        }
    }
    
    override func loadView() {
        self.view = carDetailView
    }
}

extension CarDetailViewController {
    
    func setUpView(with car: Car) {
        carDetailView.titleLabel.text = "Detalhes do Carro"
        carDetailView.brandDescription.text = car.marca
        carDetailView.modelDescription.text = car.modelo
        carDetailView.yearDescription.text = car.ano
        carDetailView.valueDescription.text = formatterValue(to: car.valor)
        
        carDetailView.brandTitle.text = "Marca"
        carDetailView.modelTitle.text = "Modelo"
        carDetailView.yearTitle.text = "Ano"
        carDetailView.valueTitle.text = "Preço"
    
    }
    
    func didEnd() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

extension CarDetailViewController {

    fileprivate func formatterValue(to price: Double) -> String {
    
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        
        let formatterString = formatter.string(from: price as NSNumber)
        
        return formatterString ?? ""
    }
}


