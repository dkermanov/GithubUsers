//
//  GithubUsersService.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation
import RxSwift

public final class GithubUsersService {
    // MARK: - Properties

    private let network: NetworkRequestable
    
    private let decoder: DecoderProtocol

    // MARK: - Initializer

    public init(
        network: NetworkRequestable = NetworkProvider(),
        decoder: DecoderProtocol = NetworkDecoder()
    ) {
        self.network = network
        self.decoder = decoder
    }

    // MARK: - Functions

    public func getUsers() -> Single<String> {
        Single.create { [network, decoder] observer in
            let task = network.request(GithubUsersEndpoint.users) { result in
                switch result {
                case let .success(data):
                    guard let data = data else {
                        return observer(.failure(GithubUsersServiceError.emptyResponse))
                    }

                    do {
                        let users: [GithubUser] = try decoder.decode(from: data)
                        print(users)
                    } catch {
                        observer(.failure(GithubUsersServiceError.decodingFailure))
                    }

                case let .failure(error):
                    observer(.failure(GithubUsersServiceError.custom(error)))
                }
            }
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
