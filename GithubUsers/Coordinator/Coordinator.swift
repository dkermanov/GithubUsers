//
//  Coordinator.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import Foundation
import UIKit

protocol Coordinator {
    // MARK: - Properties

    var navigationController: UINavigationController { get }

    // MARK: - Functions

    func start()
}
