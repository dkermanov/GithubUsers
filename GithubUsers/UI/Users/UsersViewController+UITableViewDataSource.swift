//
//  UsersViewController+UITableViewDataSource.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 04.10.21.
//

import Foundation
import UIKit

extension UsersViewController: UITableViewDataSource {
    // MARK: - Functions
    
    public func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    public func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let item = viewModel.itemViewModel(at: indexPath) else {
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
}
