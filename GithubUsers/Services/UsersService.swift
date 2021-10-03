//
//  UsersService.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation
import RxSwift

public final class UsersService: UsersServiceInterface {
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

    public func getUsers() -> Single<[User]> {
        decode(UsersEndpoint.users)
    }
    
    private func decode<DecodableObject: Decodable>(
        _ endpoint: RequestEndpoint
    ) -> Single<DecodableObject> {
        network
            .request(endpoint)
            .flatMap { [decoder] data in
                do {
                    let object: DecodableObject = try decoder.decode(from: data)
                    return .just(object)
                } catch {
                    return .error(UsersServiceError.decodingFailure)
                }
            }
    }
}
