//
//  NetworkDecoder.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

public struct NetworkDecoder: DecoderProtocol {
    // MARK: - Properties

    private let decoder: JSONDecoder
    
    // MARK: - Initializer
    
    public init(_ decoder: JSONDecoder = .init()) {
        // Configure JSONDecoder additionally here if needed
        self.decoder = decoder
    }

    // MARK: - Functions

    public func decode<DecodableObject: Decodable>(
        from data: Data
    ) throws -> DecodableObject {
        try decoder.decode(
            DecodableObject.self,
            from: data
        )
    }
}
