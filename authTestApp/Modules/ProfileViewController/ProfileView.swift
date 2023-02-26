//
//  ProfileView.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

class ProfileView: UIView {

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        fill()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Properties
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.keyboardDismissMode = .onDrag
        scroll.showsVerticalScrollIndicator = false
        scroll.bounces = false

        return scroll
    }()

    lazy var contentView = UIView()

    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.backgroundColor = .lightGray

        return imageView
    }()

    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)

        return label
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .light)

        return label
    }()

    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12, weight: .light)

        return label
    }()

    // MARK: Fill
    private func fill() {
        backgroundColor = .white

        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.bottom.centerX.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(250)
        }

        contentView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }

        contentView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(20)
        }

        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(15)
            make.left.right.equalTo(emailLabel)
        }

        contentView.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            make.left.right.equalTo(nameLabel)
        }
    }
}
