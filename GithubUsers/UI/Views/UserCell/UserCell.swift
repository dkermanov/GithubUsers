//
//  UserCell.swift
//  GithubUsers
//
//  Created by Dmitriy Kermanov on 04.10.21.
//

import Foundation
import UIKit

public final class UserCell: UITableViewCell {
    // MARK: - Properties

    public static var reuseIdentifier: String {
        "UserCell"
    }

    public var viewModel: UserCellViewModelProtocol?
        
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(
            ofSize: 16.0,
            weight: .regular
        )
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: - Initializer
        
    public override required init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        
        setup()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions: Life cycle
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        viewModel = nil
        userNameLabel.text = nil
    }

    // MARK: - Functions: Interface
    
    public func populate(with viewModel: UserCellViewModelProtocol) {
        self.viewModel = viewModel
        
        userNameLabel.text = viewModel.getName()
    }

    // MARK: - Functions: UI
    
    private func setup() {
        selectionStyle = .none
        backgroundColor = .white
        
        setupUserNameLabel()
    }
    
    private func setupUserNameLabel() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userNameLabel)
        
        let bottomConstraint = userNameLabel
            .bottomAnchor
            .constraint(
                equalTo: bottomAnchor,
                constant: -16.0
            )
        bottomConstraint.priority = .init(999.0)
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16.0
            ),
            userNameLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16.0
            ),
            userNameLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16.0
            ),
            bottomConstraint
        ])
    }
}
