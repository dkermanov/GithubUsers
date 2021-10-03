//
//  NetworkProviderError.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

public enum NetworkProviderError: Error {
    // MARK: - Cases

    case emptyResponse
        
    case custom(Error)
}
