//
//  GithubUsersService.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

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

    public func getUsers() {
        network.request(GithubUsersEndpoint.users) { [decoder] result in
            switch result {
            case let .success(data):
                guard let data = data else {
                    return // TODO: throw error here
                }
                
                do {
                    let users: [GithubUser] = try decoder.decode(from: data)
                    print(users)
                } catch {
                    print(error)
                }
                
            case let .failure(error):
                print(error)
            }
        }
    }
}
