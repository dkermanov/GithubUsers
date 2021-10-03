//
//  UsersServiceInterface.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation
import RxSwift

public protocol UsersServiceInterface {
    // MARK: - Functions

    func getUsers() -> Single<[User]>
}
