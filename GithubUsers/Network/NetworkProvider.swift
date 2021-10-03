//
//  NetworkProvider.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

public final class NetworkProvider {
    // MARK: - Properties

    private let session: URLSession
    
    // MARK: - Initializer

    public init(_ session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    // MARK: - Functions
    
    public func request(endpoint: RequestEndpoint) {
        var request = URLRequest(url: endpoint.baseURL)
        request.httpMethod = endpoint.method.rawValue

        session
            .dataTask(with: request) { data, response, err in
                print(data ?? "")
            }
            .resume()
    }
}
