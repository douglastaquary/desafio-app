//
//  ModelsTable.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

final class ModelsTable: UITableView {
    
    
    var didSelectModel: ((Model) -> Void)?
    
    fileprivate var customDatasource: ModelTableDatasource?
    fileprivate var customDelegate: ModelsTableDelegate?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        customDelegate = ModelsTableDelegate(self)
        customDatasource = ModelTableDatasource(items: [],
                                                tableView: self,
                                                delegate: customDelegate!)
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ModelsTable {
    func updateItems(_ items: [Model]) {
        customDatasource?.updateItems(items)
    }
}

extension ModelsTable: ModelsDelegate {
    func didSelectModel(at index: IndexPath) {
        let itemsCount = numberOfRows(inSection: 0)
        guard itemsCount > index.row else {
            return
        }
        if let model = customDatasource?.items[index.row] {
            didSelectModel?(model)
        }
    }
}
