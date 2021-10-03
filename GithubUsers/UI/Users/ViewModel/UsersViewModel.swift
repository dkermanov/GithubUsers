//
//  UsersViewModel.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation
import RxSwift

public final class UsersViewModel: UsersViewModelProtocol {
    // MARK: - Properties

    private let service: UsersServiceProtocol
    
    private var dataSource: [User]

    private let disposeBag: DisposeBag
        
    // MARK: - Initializer
    
    public init(_ service: UsersServiceProtocol) {
        self.service = service
        self.dataSource = []
        self.disposeBag = DisposeBag()
    }
    
    // MARK: - Functions

    public func numberOfRows(in section: Int) -> Int {
        return dataSource.count
    }
    
    public func itemViewModel(at indexPath: IndexPath) -> User? {
        guard dataSource.indices.contains(indexPath.row) else {
            return nil
        }
        
        return dataSource[indexPath.row]
    }
    
    public func getUsers(completion: (() -> Void)?) {
        service
            .getUsers()
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { users in
                self.dataSource = users
                completion?()
            })
            .disposed(by: disposeBag)
    }
}
