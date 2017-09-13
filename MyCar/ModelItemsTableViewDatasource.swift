//
//  ModelItemsTableViewDatasource.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

protocol ModelItemsTableViewDatasource: UITableViewDataSource {
    
    associatedtype T
    
    var items:[T] {get}
    
    weak var tableView: UITableView? {get}
    weak var delegate: UITableViewDelegate? {get}
    
    init(items: [T], tableView: UITableView, delegate: UITableViewDelegate)
    
    func setUpTableView()
}

extension ModelItemsTableViewDatasource {
    func setUpTableView() {
        self.tableView?.dataSource = self
        self.tableView?.delegate = self.delegate
        self.tableView?.reloadData()
    }
}
