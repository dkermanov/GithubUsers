//
//  User.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

public struct User: Identifiable, Decodable {
    // MARK: - Constants

    private enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
    }
    
    // MARK: - Properties

    public let id: Int

    public let name: String
    
    // MARK: - Initializer

    public init(
        id: Int,
        name: String
    ) {
        self.id = id
        self.name = name
    }
}
