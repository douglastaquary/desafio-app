//
//  BrandModelYearPriceView.swift
//  MyCar
//
//  Created by Douglas Taquary on 12/09/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

public protocol BrandModelYearPriceViewProtocol {
    
    var brand: NSAttributedString { get }
    var model: NSAttributedString { get }
    var year: NSAttributedString { get }
    var price: NSAttributedString { get }


    var flexibleHeight: Bool { get }
    
}

public class BrandModelYearPriceView: UIView {
    
    struct EmptyViewModel: BrandModelYearPriceViewProtocol {
        let brand: NSAttributedString = NSAttributedString()
        let model: NSAttributedString = NSAttributedString()
        let year: NSAttributedString = NSAttributedString()
        let price: NSAttributedString = NSAttributedString()


        let flexibleHeight: Bool = false
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.setContentHuggingPriority(UILayoutPriorityRequired,
                                        for: .vertical)
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.setContentHuggingPriority(UILayoutPriorityRequired,
                                        for: .vertical)
        
        return label
    }()
    
    var bottomFixedConstraint: NSLayoutConstraint?
    

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        update()
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp()
    {
        let grid: CGFloat = 8
        let padding: CGFloat = grid * 3
        let space: CGFloat = grid * 2
        
        let contentView = self
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                        constant: padding).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                            constant: padding).isActive = true
        titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor,
                                             constant: -padding).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                              constant: space).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor,
                                                   constant: -padding).isActive = true
        
        let bottomGuide = UILayoutGuide()
        contentView.addLayoutGuide(bottomGuide)
        
        bottomGuide.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        bottomGuide.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bottomGuide.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        bottomGuide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                            constant: -padding).isActive = true
        
        bottomFixedConstraint =
            bottomGuide.heightAnchor.constraint(equalToConstant: 0)
    }
    
    func update() {
    }
    
}
