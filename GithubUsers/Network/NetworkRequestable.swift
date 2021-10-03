//
//  NetworkRequestable.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation
import RxSwift

public protocol NetworkRequestable {
    // MARK: - Constants

    typealias RequestResult = Result<Data?, Error>
    
    // MARK: - Functions
    
    func request(_ endpoint: RequestEndpoint) -> Single<RequestResult>
}
