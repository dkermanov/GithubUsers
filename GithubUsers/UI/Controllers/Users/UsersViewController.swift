//
//  UsersViewController.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 03.10.21.
//

import UIKit
import RxSwift

class UsersViewController: UIViewController {
    // MARK: - Properties

    public let viewModel: UsersViewModelProtocol
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Initializer
    
    public required init(_ viewModel: UsersViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions: life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    // MARK: - Functions: UI

    private func setup() {
        title = "Github Users"
        view.backgroundColor = .white
        
        setupTableView()
    }
    
    private func setupTableView() {
        let tableView = UITableView()
        tableView.register(
            UserCell.self,
            forCellReuseIdentifier: UserCell.reuseIdentifier
        )
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            )
        ])
        
        viewModel.getUsers {
            tableView.reloadData()
        }
    }
}

