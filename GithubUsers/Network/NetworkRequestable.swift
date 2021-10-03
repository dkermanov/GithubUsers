//
//  NetworkRequestable.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

public protocol NetworkRequestable {
    // MARK: - Constants
    
    typealias RequestCompletion = (Result<Data?, Error>) -> Void

    // MARK: - Functions
    
    @discardableResult
    func request(
        _ endpoint: RequestEndpoint,
        _ completion: @escaping RequestCompletion
    ) -> URLSessionDataTask
}
