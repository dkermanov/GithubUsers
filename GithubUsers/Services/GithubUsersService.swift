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
    
    // MARK: - Initializer

    public init(_ network: NetworkRequestable = NetworkProvider()) {
        self.network = network
    }

    // MARK: - Functions

    public func getUsers() {
        network.request(GithubUsersEndpoint.users) { result in
            switch result {
            case let .success(data):
                guard let data = data else {
                    return // TODO: throw error here
                }
                
                let decoder = JSONDecoder()
                do {
                    let users = try decoder.decode([GithubUser].self, from: data)
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
