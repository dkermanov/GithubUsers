//
//  Repository.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

public struct Repository: Identifiable, Decodable {
    // MARK: - Properties

    public let id: Int

    public let name: String
    
    public let owner: User
    
    // MARK: - Initializer

    public init(
        id: Int,
        name: String,
        owner: User
    ) {
        self.id = id
        self.name = name
        self.owner = owner
    }
}
