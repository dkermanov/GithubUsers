//
//  NetworkProvider.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation
import RxSwift

public final class NetworkProvider: NetworkRequestable {
    // MARK: - Properties

    private let session: URLSession
    
    // MARK: - Initializer

    public init(_ session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    // MARK: - Functions
    
    public func request(_ endpoint: RequestEndpoint) -> Single<Data> {
        Single.create { [session] observer in
            var request = URLRequest(url: endpoint.baseURL)
            request.httpMethod = endpoint.method.rawValue

            let task = session.dataTask(with: request) { data, _, error in
                if let error = error {
                    observer(.failure(NetworkProviderError.custom(error)))
                } else if let data = data {
                    observer(.success(data))
                } else {
                    observer(.failure(NetworkProviderError.emptyResponse))
                }
            }
            
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
