//
//  GithubUsersEndpoint.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

public enum GithubUsersEndpoint: RequestEndpoint {
    // MARK: - Cases

    case users
    
    // MARK: - Properties

    public var host: String {
        "https://api.github.com"
    }
    
    public var path: String {
        switch self {
        case .users:
            return "users"
        }
    }
    
    public var method: RequestMehod {
        .get
    }
}
