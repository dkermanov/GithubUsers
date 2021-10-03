//
//  NetworkProvider.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

public final class NetworkProvider: NetworkRequestable {
    // MARK: - Properties

    private let session: URLSession
    
    // MARK: - Initializer

    public init(_ session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    // MARK: - Functions
    
    @discardableResult
    public func request(
        _ endpoint: RequestEndpoint,
        _ completion: @escaping RequestCompletion
    ) -> URLSessionDataTask {
        var request = URLRequest(url: endpoint.baseURL)
        request.httpMethod = endpoint.method.rawValue

        let task = session.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(data))
            }
        }
        
        task.resume()
        
        return task
    }
}
