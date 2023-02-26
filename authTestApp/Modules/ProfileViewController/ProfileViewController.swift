//
//  ProfileViewController.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private let vcView = ProfileView()
    private let presenter = ProfilePresenter()

    override func loadView() {
        view = vcView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        navigationItem.hidesBackButton = true

        let sample = UIBarButtonItem(title: "Выйти", style: .plain,
                                     target: self, action: #selector(logOut))

        navigationItem.rightBarButtonItem = sample

        presenter.getUserInfo(vcView)
    }

    @objc func logOut() {
        UserDefaults.standard.set(" ", forKey: "token")
        UserDefaults.standard.set(false, forKey: "signedIn")
        navigationController?.pushViewController(AuthViewController(), animated: true)
    }

}
