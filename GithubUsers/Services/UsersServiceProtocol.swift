//
//  UsersServiceProtocol.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation
import RxSwift

public protocol UsersServiceProtocol {
    // MARK: - Functions

    func getUsers() -> Single<[User]>
    
    func getRepositories(for userName: String) -> Single<[Repository]>
}
