//
//  AppCoordinator.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation
import UIKit

public final class AppCoordinator: Coordinator {
    // MARK: - Properties
    
    public let navigationController: UINavigationController
    
    // MARK: - Initializer

    public init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions

    public func start() {
        pushGithubUsers()
    }
    
    private func pushGithubUsers() {
        let vm = UsersViewModel(UsersService())
        let vc = UsersViewController(vm)
        navigationController.pushViewController(
            vc,
            animated: false
        )
    }
}
