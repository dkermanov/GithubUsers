//
//  Decodable.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

// Because 'Decodable' name is already used in Swift
public protocol DecoderProtocol {
    // MARK: - Functions

    func decode<DecodableObject: Decodable>(
        from data: Data
    ) throws -> DecodableObject
}
