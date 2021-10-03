//
//  UsersEndpoint.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

public enum UsersEndpoint: RequestEndpoint {
    // MARK: - Cases

    case users
    
    case repositories(_ userName: String)
    
    // MARK: - Properties

    public var host: String {
        "https://api.github.com"
    }
    
    public var path: String {
        switch self {
        case .users:
            return "users"
        case let .repositories(userName):
            return "users/\(userName)/repos"
        }
    }
    
    public var method: RequestMehod {
        .get
    }
}
