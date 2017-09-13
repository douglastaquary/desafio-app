//
//  CarDetailView.swift
//  MyCar
//
//  Created by Douglas Taquary on 11/09/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

//

import UIKit

public class CarDetailView: UIView {
    

    let cancelButton: UIButton = UIButton(type: .system)
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        return label
    }()
    
    let brandTitle: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        return label
    }()
    
    let brandDescription: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        return label
    }()
    
    
    let modelTitle: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        return label
    }()
    
    let modelDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        return label
    }()
    
    
    let valueTitle: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        return label
    }()
    
    let valueDescription: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        return label
    }()
    
    
    let yearTitle: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        return label
    }()
    
    
    let yearDescription: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriorityRequired, for: .vertical)
        return label
    }()
    
    let stackViewMaster: UIStackView = {
        let view = UIStackView()
        view.spacing = 0
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    
    public var topOffset: CGFloat {
        set(topOffset) {
            topConstraint?.constant = topOffset
        }
        
        get {
            return topConstraint?.constant ?? 0
        }
    }
    
    var topConstraint: NSLayoutConstraint?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
        
        updateView()
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        
        let contentView = self
        let topBar = UIView()
        let grid: CGFloat = 8
        
        let bottomLine = UIView()
        let bottomLineField = UIView()
        let separateClear = UIView()
        
        
        bottomLine.backgroundColor = .lightGray
        separateClear.backgroundColor = UIColor.clear
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        topBar.addSubview(bottomLine)
        
        bottomLine.leftAnchor.constraint(equalTo: topBar.leftAnchor).isActive = true
        bottomLine.rightAnchor.constraint(equalTo: topBar.rightAnchor).isActive = true
        bottomLine.bottomAnchor.constraint(equalTo: topBar.bottomAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        bottomLineField.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separateClear.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        topBar.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topBar.topAnchor,
                                        constant: grid * 3).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomLine.topAnchor,
                                           constant: -grid * 3).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: topBar.centerXAnchor).isActive = true
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        topBar.addSubview(cancelButton)
        
        cancelButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: topBar.leadingAnchor,
                                              constant: grid * 2).isActive = true
        
        topBar.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(topBar)
        
        topConstraint = topBar.topAnchor.constraint(equalTo: contentView.topAnchor)
        topConstraint?.isActive = true
        topBar.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        topBar.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        stackViewMaster.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackViewMaster)
        
        stackViewMaster.topAnchor.constraint(equalTo: topBar.bottomAnchor,
                                             constant: 0).isActive = true
        stackViewMaster.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                              constant: grid * 2).isActive = true
        stackViewMaster.rightAnchor.constraint(equalTo: contentView.rightAnchor,
                                               constant: -grid * 2).isActive = true
        stackViewMaster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                constant: -grid * 4).isActive = true
        
        let arrayViews = [brandTitle, brandDescription, modelTitle, modelDescription, yearTitle, yearDescription, valueTitle, valueDescription]
        
        arrayViews.forEach { stackViewMaster.addArrangedSubview($0) }
                
        backgroundColor = .white
    }
    
    func updateView() {
    
        cancelButton.setTitle("Cancelar", for: .normal)
        cancelButton.titleLabel?.textColor = .lightGray
        
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightHeavy)
        
        
        //All titles
        
        brandTitle.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightHeavy)
        brandTitle.textColor = .lightGray
        
        modelTitle.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightHeavy)
        modelTitle.textColor = .lightGray
        
        yearTitle.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightHeavy)
        yearTitle.textColor = .lightGray
        
        valueTitle.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightHeavy)
        valueTitle.textColor = .lightGray
        
        //All Descriptors
        
        brandDescription.font = UIFont.systemFont(ofSize: 32, weight: UIFontWeightHeavy)
        brandDescription.textColor = .black
        
        modelDescription.font = UIFont.systemFont(ofSize: 28, weight: UIFontWeightHeavy)
        modelDescription.textColor = .black
        
        yearDescription.font = UIFont.systemFont(ofSize: 28, weight: UIFontWeightHeavy)
        yearDescription.textColor = .black
        
        valueDescription.font = UIFont.systemFont(ofSize: 28, weight: UIFontWeightHeavy)
        valueDescription.textColor = .black
        
   
        
    }
    
}
