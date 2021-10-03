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
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: UserCell.reuseIdentifier
        ) as? UserCell else {
            return UITableViewCell()
        }
        
        if let itemViewModel = viewModel.itemViewModel(at: indexPath) {
            cell.populate(with: itemViewModel)
        }
        
        return cell
    }
}
