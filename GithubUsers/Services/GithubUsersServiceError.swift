//
//  GithubUsersServiceError.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

public enum GithubUsersServiceError: Error {
    // MARK: - Cases

    case emptyResponse
    
    case decodingFailure
    
    case custom(Error)
}
