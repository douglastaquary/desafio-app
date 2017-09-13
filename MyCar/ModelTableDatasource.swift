//
//  ModelTableDatasource.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

final class ModelTableDatasource: NSObject, ModelItemsTableViewDatasource {
    
    var items: [Model] = []
    
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    
    required init(items: [Model], tableView: UITableView, delegate: UITableViewDelegate) {
        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        
        super.init()
        
        tableView.register(cellType: ModelTableCell.self)
        tableView.separatorStyle = .none
        
        self.setUpTableView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ModelTableCell.self)
        
        let model = self.items[indexPath.row]
        cell.setup(item: model)
        return cell
    }
    
    func updateItems(_ items: [Model]) {
        self.items = items
        self.tableView?.reloadData()
    }
}


class ModelsTableDelegate: NSObject, UITableViewDelegate {
    
    let delegate: ModelsDelegate
    
    init(_ delegate: ModelsDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ModelTableCell.height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectModel(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
