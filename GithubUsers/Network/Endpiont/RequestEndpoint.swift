//
//  RequestEndpoint.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation

public protocol RequestEndpoint {
    // MARK: - Properties

    var host: String { get }
    
    var path: String { get }
    
    var method: RequestMehod { get }
    
    var baseURL: URL { get }
}

public extension RequestEndpoint {
    // MARK: - Properties

    var baseURL: URL {
        URL(string: "\(host)/\(path)")!
    }
}
