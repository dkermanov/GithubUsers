//
//  UsersViewModelProtocol.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation
import RxSwift

public protocol UsersViewModelProtocol {
    // MARK: - Functions

    func numberOfRows(in section: Int) -> Int
    
    func itemViewModel(at indexPath: IndexPath) -> User?
    
    func getUsers(completion: (() -> Void)?)
}
