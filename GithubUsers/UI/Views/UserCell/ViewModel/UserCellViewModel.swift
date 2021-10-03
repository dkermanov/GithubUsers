//
//  UserCellViewModel.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 04.10.21.
//

import Foundation

public final class UserCellViewModel: UserCellViewModelProtocol {
    // MARK: - Properties
    
    private let user: User

    // MARK: - Initializer
    
    public init(_ user: User) {
        self.user = user
    }
    
    // MARK: - Functions

    public func getName() -> String {
        user.name
    }
}
